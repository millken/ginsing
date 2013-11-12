#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <mysql/mysql.h>
#include <assert.h>
#include "cplus.h"
#include "pack.h"



std::map<int,std::string> map_dc;

char datacenter[DC_LEN];
char host[LEN];
char port[LEN];
char user[LEN];
char pwd[LEN];
char name[LEN];
char evf[LEN];

int64_t num_rec ;
int loc_start;
FILE *ufp;

int drops(char *buf)
{
    char *arry;
    int size;

    arry = buf;
    size = strlen(arry);

    if(size==0){
        return 1;
    }

    while((*arry)!='\0'){
        if(((*arry)==';')||((*arry)=='\n')||((*arry)=='\t')){
            *arry='\0';
            break;
        } else if ((*arry == ' ') &&(*(arry+1) == ' ')) {
            *arry ='\0';
            break;
        }
        arry++;
    }
    return 0;
}


void get_value(char *buf,char *mem) {
    char *tp;
    int blen;
    int flen;

    tp = strchr(buf,'=');

    if (tp != NULL ) {
        tp = tp + 1;
        while( (*tp == ' ')&&(*tp != '\0')) {
            tp++;
        }
        blen = strlen(buf);
        flen = strlen(tp);
        if ((flen -1) > LEN) {
            printf("%s is too len\n",tp);
            exit(1);
        }
        memcpy(mem,buf+blen-flen,flen);

    }
}


int get_member(char *buf) {

	if( strstr(buf,"host") != NULL ) {
		get_value(buf,host);
        drops(host);
	} else if( strstr(buf,"port") != NULL) {
		get_value(buf,port);
        drops(port);
	} else if( strstr(buf,"user") != NULL) {
		get_value(buf,user);
        drops(user);
	} else if ( strstr(buf,"pwd") != NULL) {
		get_value(buf,pwd);
        drops(pwd);
	} else if ( strstr(buf,"name") != NULL) {
		get_value(buf,name);
        drops(name);
	} 

	return 0;

}

int get_datacenter(char *line) {
	char key[LEN],value[LEN];
	char *ch;
	
	ch = strchr(line,'=');
	if (ch == NULL) return 1;	
	*ch = '\0';
	strcpy(value,line);
	strcpy(key,ch+1);
	drops(value);
	drops(key);
	
	map_datacenter(map_dc,key,value);

	return 0;
}

int getDBmem() {
	FILE *fp;
	char line[LEN];
	int flag = 0;
	
	memset(line,0,sizeof(line));

	sprintf(line,"%s%s",evf,CONFIG);
	fp = fopen(line,"r");
	assert(fp != NULL);	
	
	while( fgets(line,sizeof(line),fp) ) {
		if (flag == 1) {
			get_datacenter(line);
		} else {
			get_member(line);	
		}
		if (strstr(line,"[datacenter]")) flag = 1;
	}
	
	return 0;
}



int map_datacenter(std::map<int,std::string> &mp,char *key,char *value)
{
	std::map<int,std::string>::iterator it;
	
	it = mp.find(atoi(key));
	if (it == mp.end()) {
		mp.insert(std::pair<int,std::string>(atoi(key),value));
	} else {
		fprintf(stderr,"%s have double %s key",value,key);
		exit(1);
	}

	return 0;
}

int fileContent(FILE *fp,char *sql)
{  
	MYSQL connection;  
	MYSQL_RES *sqlres;  
	MYSQL_ROW sqlrow;
	int res,t;  
  
    mysql_init(&connection);  
	//printf("host=%s,user=%s,pwd=%s,name=%s,port=%s\n",host,user,pwd,name,port);  
    if(mysql_real_connect(&connection,host,user,pwd,name,atoi(port),NULL,0)) {  
        res = mysql_query(&connection, sql);  
        if( res ) { 
            printf("SELECT error: %s\n", mysql_error(&connection));  
        } else {  
            sqlres = mysql_store_result(&connection);  
            if( sqlres ) { 
                printf("Retrieved %lu rows\n", (unsigned long)mysql_num_rows(sqlres));  
                while((sqlrow = mysql_fetch_row(sqlres))) {
						fprintf(fp,"%s,%s\n",sqlrow[0],sqlrow[1]);
						num_rec++;
                }
                if( mysql_errno(&connection) ) {  
                    fprintf(stderr, "Retrive error: %s\n", mysql_error(&connection));  
                }  
                mysql_free_result(sqlres);  
            }  
  
        }  
        mysql_close(&connection);  
    }  else { 
        if(mysql_errno(&connection)) { 
            fprintf(stderr, "Connection error %d: %s\n", mysql_errno(&connection), mysql_error(&connection));  
			return 1;
        }  
    }  
  
    return 0;  
}  
int main (int argc,char **argv) {
	FILE *blcfp;
	char *ch;
	char evbuf[LEN];

	memset(host,0,sizeof(host));
	memset(port,0,sizeof(port));
	memset(user,0,sizeof(user));
	memset(pwd,0,sizeof(pwd));
	memset(name,0,sizeof(name));
	memset(evf,0,sizeof(evf));
		
	strcpy(evf,argv[0]);
	ch = strrchr(evf,'/');	
	*(ch+1) = '\0';
	

    sprintf(evbuf,"%s%s",evf,BLCNAME);
    blcfp = fopen(evbuf,"w");
	if(!blcfp) fprintf(stderr,"can not open file %s  error:%s\n",evbuf,strerror(errno));

	getDBmem();

	num_rec = 0;
	loc_start = 0;

	fileContent(blcfp,BLCSQL);

    fclose(blcfp);

	printf("rec.size()=%d, map_dc.size()=%d\n",num_rec,map_dc.size());


	ufp = fopen(OUTFILE,"wb");
	pack_head();
 	pack_datacenter();
	pack_rec();

	fclose(ufp);

	return 0;
}
