/*
  Copyright (c) 2013
  Author: Jeff Weisberg <jaw @ solvemedia.com>
  Created: 2013-Jan-07 11:29 (EST)
  Function: read zone file
*/
#define CURRENT_SUBSYSTEM	'Z'

#include "defs.h"
#include "misc.h"
#include "diag.h"
#include "config.h"
#include "dns.h"
#include "zdb.h"
#include "version.h"

#include <sys/socket.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <algorithm>

ZDB *zdb = 0;



void
zdb_init(void){

    if( !load_zdb() )
        exit(1);
}


//################################################################

RRSet::RRSet(Zone* z, string *l, bool wp){

    wildcard = wp;
    name = *l;
    zone = z;
    delegation = 0;
    if( l->empty() )
        fqdn = zone->zonename;
    else
        fqdn = name + "." + zone->zonename;
}

// s: foo.example.com
// t:     example.com
static bool
match(const char *s, int sl, const char *t, int tl){

    int so = sl - tl;
    if( so < 0 ) return 0;
    if( memcmp(s + so, t, tl) ) return 0;
    if( !so ) return 1;		// exact match
    if( s[so - 1] == '.' ) return 1;
    return 0;
}

bool
RRSet::wildmatch(const char *s, int l) const {

    return match(s, l, fqdn.c_str(), fqdn.length());
}

bool
Zone::zonematch(const char *s, int l) const {

    return match(s, l, zonename.c_str(), zonename.length());
}

//################################################################

// add record to the zone
int
Zone::insert(ZDB *db, RR *rr, string *label,int flag){
    bool wildp = rr->wildcard;

    // existing RRSet? add. else create new RRSet
    RRSet *rrs = find_rrset( label, wildp );
	if( (! rrs)||(flag == 1)) {
        rrs = RRSet::make(this, label, wildp, rr->type);
        if( ! rrs ){
            BUG("create rrs failed! type %d", rr->type);
            return 0;
        }
        rrset.push_back(rrs);

        // delegated subdomains will be wired later (zdb::analyze)
        if( ! rrs->delegation )
            db->insert(rrs,rr->type);

        DEBUG("new RRSet wild %d, name %s, zone %s; fqdn %s", wildp, label->c_str(), zonename.c_str(), rrs->fqdn.c_str());
    } 


    // glb RR + RRSet must match
    //if( ! rrs->is_compat(rr) )
    //    return 0;

    rrs->add_rr(rr);

    if( label->empty() ){
        if( rr->type == TYPE_NS ) ns.push_back(rr);
        if( rr->type == TYPE_SOA) soa = rr;
    }

    return 1;
}

// add a new rrset to the db
int
ZDB::insert(RRSet *rrs,int type){

    if( rrs->wildcard ) {
		wildcard.push_back(rrs);
    } else {
		rrset[ rrs->fqdn.c_str() ] = rrs;
		if (strchr(rrs->fqdn.c_str(),'*')) pananalisy[rrs->fqdn.c_str()] = rrs;
	}

    return 1;
}

RRSet *
RRSet::make(Zone* z, string *l, bool wp, int type){

    if( (type & TYPE_COMPAT_MASK) == type ){
        return new RRSet(z,l,wp);
    }

    switch(type){
    case TYPE_GLB_RR:
        return new RRSet_GLB_RR(z,l,wp);
    case TYPE_GLB_GEO:
        return new RRSet_GLB_Geo(z,l,wp);
    case TYPE_GLB_MM:
        return new RRSet_GLB_MM(z,l,wp);
    case TYPE_GLB_Hash:
        return new RRSet_GLB_Hash(z,l,wp);
    default:
        return 0;
    }

    return 0;
}

bool
RRSet::is_compat(RR *r) const {
    // std rrset - std rrs
    return (r->type & TYPE_COMPAT_MASK == r->type) ? 0 : 1;
}

bool
RRSet_GLB_RR::is_compat(RR *r) const {
    return r->type == TYPE_GLB_RR;
}
bool
RRSet_GLB_Geo::is_compat(RR *r) const {
    return r->type == TYPE_GLB_GEO;
}
bool
RRSet_GLB_MM::is_compat(RR *r) const {
    return r->type == TYPE_GLB_MM;
}
bool
RRSet_GLB_Hash::is_compat(RR *r) const {
    return r->type == TYPE_GLB_MM;
}


void
RRSet::add_rr(RR *r){
    rr.push_back(r);
    if( r->delegation ) delegation = 1;
}

//################################################################

int
Zone::analyze(ZDB *db){

    for(int i=0; i<rrset.size(); i++){
        rrset[i]->analyze(this);
    }
    return 1;
}

int
RRSet::analyze(Zone *z){

    for(int i=0; i<rr.size(); i++){
        RR *r = rr[i];
        r->analyze(z);
    }

    return 1;
}

// find + attach A+AAAA to NS+CNAME
void
RR_Compress::analyze(Zone *z){

    if( type != TYPE_NS && type != TYPE_CNAME ) return;
    if( ! rrdata.same_zone ) return;

    RRSet *rrs = z->find_rrset( & rrdata.name, 0 );
    if( ! rrs ) return;

    for(int i=0; i< rrs->rr.size(); i++){
        RR *rr = rrs->rr[i];
        if( rr->klass != CLASS_IN ) continue;
        if( rr->type == TYPE_A || rr->type == TYPE_AAAA ){
            DEBUG("found addr for %s -> %s", name.c_str(), rrs->fqdn.c_str());
            additional.push_back(rr);
        }
    }
}

void
RR_MX::analyze(Zone *z){

    if( ! dest.same_zone ) return;

    RRSet *rrs = z->find_rrset( & dest.name, 0 );
    if( ! rrs ) return;

    for(int i=0; i<rrs->rr.size(); i++){
        RR *rr = rrs->rr[i];
        if( rr->klass != CLASS_IN ) continue;
        if( rr->type == TYPE_A || rr->type == TYPE_AAAA ){
            DEBUG("found addr for %s -> %s", name.c_str(), rrs->fqdn.c_str());
            additional.push_back(rr);
        }
    }
}

void
RR_Alias::wire_up(ZDB *db, Zone *z, RRSet *s){

    // same zone?
    RRSet *rrs = z->find_rrset( & target, 0 );
    if( ! rrs ){int option; rrs = db->find_rrset( target.c_str(),TYPE_A,0,NULL,option);}
    if( !rrs ){
        PROBLEM("cannot locate ALIAS target %s => %s", s->fqdn.c_str(), target.c_str());
        return;
    }

    DEBUG("found alias %s => %s", s->fqdn.c_str(), target.c_str());

    for(int i=0; i<rrs->rr.size(); i++){
        RR *r = rrs->rr[i];
		if( r->type == TYPE_GLB_MM) {
			RR_GLB_MM *m = (RR_GLB_MM*)r;
			char *ch = strstr((char*)(s->fqdn.c_str()),"_TYPE");
			if( ch ) {
				if(!strcmp(ch+5,m->compname.c_str())){
					PROBLEM("cannot ALIAS => GLB (%s => %s)", ch+5 , target.c_str());
					return;
				}
			} else {
				if( !strcmp(s->fqdn.c_str(),m->compname.c_str())) {
					PROBLEM("cannot ALIAS => GLB (%s => %s)", s->fqdn.c_str(), target.c_str());
					return;
				}
			}
		}
        if( r->type == TYPE_ALIAS ){
            PROBLEM("cannot ALIAS => ALIAS (%s => %s)", s->fqdn.c_str(), target.c_str());
            return;
        }
    }

    targ_rrs = rrs;
}

//################################################################

static bool
zone_compare_length(Zone *a, Zone *b){

    return a->zonename.length() > b->zonename.length();
}


// figure out what to do with delegated subdomains
//   if we host it - ignore the rrs
//   if we don't   - treat it as a wilcard + handle it
void
Zone::wire_up(ZDB *db){

    for(int i=0; i<rrset.size(); i++){
        RRSet *rs = rrset[i];

        rs->wire_up(db, this);

        if( ! rs->delegation ) continue;

        Zone *z = db->find_zone( rs->fqdn.c_str() );
        DEBUG("subdomain %s => %x => %s", rs->fqdn.c_str(), z, z? z->zonename.c_str() : "");

        if( z && z->zonename == rs->fqdn ){
            // ignore record
            DEBUG("subdomain %s is local", rs->fqdn.c_str());
        }else{
            DEBUG("wiring delegated subdomain %s", rs->fqdn.c_str());
            rs->wildcard = 1;
            db->insert(rs,1);
        }
    }
}

void
RRSet::wire_up(ZDB *db, Zone *z){

    for(int i=0; i<rr.size(); i++){
        RR *r = rr[i];
        r->wire_up(db, z, this);
    }
}


//################################################################

int
ZDB::analyze(){

    // sort zones, longest first
    std::sort( zone.begin(), zone.end(), zone_compare_length );

    // wire NS delegations, etc
    for(int i=0; i<zone.size(); i++){
        zone[i]->wire_up(this);
    }


    return 1;
}

//################################################################
RRSet *
Zone::find_flag_rrset(string *s,bool wp) const 
{
	for(int i=0;i<rrset.size();i++) {
		if((rrset[i]->wildcard == wp) && (rrset[i]->name == *s))
			return rrset[i]; 
	}	

	return 0;
}

RRSet *
Zone::find_unflag_rrset(string *s,bool wp) const
{
	char *ch;
	
	for(int i=0;i<rrset.size();i++) {
		if(rrset[i]->wildcard != wp)continue;
		ch = strstr((char*)(rrset[i]->name.c_str()),"_TYPE");
		if( ch ) {
			if(strcmp(s->c_str(),ch + 5) == 0) return rrset[i];
		} else {
			if(rrset[i]->name == *s) return rrset[i];
		}
	}

	return 0;
}

RRSet *
Zone::find_rrset(string *s, bool wp) const {

    // only used while loading zone, no need for speed
	if(strstr((char*)(s->c_str()),"_TYPE")) {
		return 	find_flag_rrset(s,wp);
	} else {
		return find_unflag_rrset(s,wp);
	}

    return 0;
}

int 
ZDB::num_level_domain(const char *s)const {
	int num = 0,len;

	len = strlen(s);
	while( len > 0 ){
		if (*(s+len-1) == '.') num++;
		len--;
	}
	return num;
}

void
ZDB::get_two_domain(const char *s,char *domain)const{
	char *ch;
	int len,num = 0;
	
	len = strlen(s);
	while ( len > 0 ) {
		if( *(s+len-1) == '.') num++;
		if( num == 3 ){ strcpy(domain,s+len);return ;}
		len--;
	}
	return ;
}

int 
ZDB::match_format(char *s,char *d) const {
	char *ps,*pd;

	pd = d; ps = s;
	if((*d != '*') && (*d != *s)) return 1;
	while ( *pd != '\0') {
		if( *pd == '*') {
			pd = pd + 1; ps = ps +1;
			if(*pd == '\0') return 0;
			if(*ps == '\0') return 1;
			continue;
		}
		ps = strchr(ps,*pd);
		if(!ps) return 1;
		ps = ps + 1;pd = pd +1;
		if((*ps == '\0')&&(*pd != '\0')) return 1;
	}
	if((*(pd - 1) != '*')&&(*ps != '\0')) return 1;

	return 0;
}

int 
ZDB::match_pananalisy_format(const char *s,const char *itorbuf,int level) const {
	char src[MAXNAME+2],dest[MAXNAME+2];
	char *sc,*scv,*d,*dv;
	int ndel = 0;

	strcpy(src,s); strcpy(dest,itorbuf);
	scv = src; dv = dest;

	while(ndel < (level - 2)) {
		sc = strchr(scv,'.'); d = strchr(dv,'.');
		*sc = '\0'; *d = '\0';
		if( match_format(scv,dv) ) return 1;
		scv = sc + 1; dv = d + 1;
		ndel++;
	}
		
	return 0;
}

RRSet *
ZDB::find_pananalisy(const char *s,int level) const {
    MapRRSet::const_iterator it;
    RRSet *r;
    char domain[MAXNAME+2],buf[MAXNAME+2];

    memset(buf,0,sizeof(buf));

    get_two_domain(s,domain);

    for( it=pananalisy.begin(); it!=pananalisy.end(); it++) {
        if( !strstr((*it).first,domain) ) continue;
        if( num_level_domain((*it).first) != level ) continue;
        if( match_pananalisy_format(s,(*it).first,level) == 1 ) continue;
        if( strcmp((*it).first,buf) <= 0) continue;
        strcpy(buf,(*it).first);
        r = it->second;
    }

    if( strlen(buf) > 0 ){DEBUG("find %s",buf); return r;}

//match *.example.com 
    sprintf(buf,"%s.%s","*",domain);
    it = pananalisy.find(buf);
    if (it != pananalisy.end()) {
        return it->second;
    }

    return 0;
}

int
ZDB::getKey(string &label,int ity,int level ) const
{
    string str;
    str = "";
    if(level == 2) str = ".";
    switch( ity ) {
        case TYPE_PTR:
            label = "PTR_TYPE" + str + label;
            break;
        case TYPE_MX:
            label = "MX_TYPE" + str + label;
            break;
        case TYPE_SRV:
            label = "SRV_TYPE" + str + label;
            break;
        case TYPE_TXT:
            label = "TXT_TYPE" + str + label;
            break;
        case TYPE_AAAA:
            label = "AAAA_TYPE" + str + label;
            break;
        case TYPE_ALIAS:
            label = "ALIAS_TYPE" + str + label;
            break;
        case TYPE_GLB_MM:
            label = "GLBMM_TYPE" + str + label;
            break;
        default:
            break;
 	} 

    return 0;

}



RRSet *
ZDB::find_rrset(const char *s,int type,int cl,NTD *nt,int &option) const {
    // rrset[ s ]
	MapRRSet::const_iterator it ;
	string label;
	int i,ity;
	int level = num_level_domain(s);


	if( level < 2 ) return 0;	

	if(( type==TYPE_A )&&( level == 2 )) {
		char buf[MAXNAME+2];
		sprintf(buf,"%s.%s",S_FLAG,s);
		it = rrset.find(buf);
		if( it!=rrset.end() ){return it->second;}
	}

	label = s;
	i = 1;
	if(type == TYPE_A) {
		while(i) {
			switch(i) {
				case 3:
					ity = type;
					break;
				case 2:
					ity = TYPE_ALIAS;
					getKey(label,ity,level);
					break;
				case 1:
					ity = TYPE_GLB_MM;
					getKey(label,ity,level);
					break;
				default:
					i = 0;
					continue;
					break;
			}
			it  = rrset.find( label.c_str() );
			if( it != rrset.end() ) {
				if( (i != 1) || (nt == NULL)){ return it->second;}
				 RRSet_GLB_MM *rrs =(RRSet_GLB_MM *)(it->second);
				 RRSet * rs = rrs->add_answers(nt,cl,type,0);
				 if( rs ) {option = 1;return rs; }	
			}
			label = s;
			i++;
		}
    } else {
        getKey(label,type,level);
        it = rrset.find(label.c_str());
        if( it != rrset.end()){return it->second;}
    }

	

	RRSet *r = find_pananalisy(s,level);
	if( r ){return r;}

    // check wildcards
	int l = strlen(s);
	for(i=0; i<wildcard.size(); i++){
		if( wildcard[i]->wildmatch(s, l) ) return wildcard[i];
	}

    return 0;
}

Zone *
ZDB::find_zone(const char *s) const {

    int l = strlen(s);
    for(int i=0; i<zone.size(); i++){
        if( zone[i]->zonematch(s, l) ) return zone[i];
    }
    return 0;
}

//################################################################

void
ZDB::add_monitored(RR *rr){
    monitored.push_back(rr);
}


//################################################################

RRSet::~RRSet(){

    for(int i=0; i<rr.size(); i++){
        RR *r = rr[i];
        delete r;
    }
}

Zone::~Zone(){

    for(int i=0; i<rrset.size(); i++){
        RRSet *r = rrset[i];
        delete r;
    }
}

ZDB::~ZDB(){

    for(int i=0; i<zone.size(); i++){
        Zone *z = zone[i];
        delete z;
    }
}
