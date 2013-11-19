#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "cplus.h"
#include "pack.h"


int get_mask(char *cidr,char *sip,char *mask) {
	char *ch;
	char tp[LEN];

	memset(tp,0,sizeof(tp));
	
	ch = strchr(cidr,'/');	
	if (ch == NULL) return 1;
	memcpy(tp,cidr,strlen(cidr)-strlen(ch));		

	strcpy(sip,tp);
	strcpy(mask,ch+1);
	return 0;
}

int pack_rec() {
	FILE *fp;
	struct MMD_Rec rec;
	char sip[LEN],mask[LEN],metric[LEN],cidr[LEN];
	char evbuf[LEN],line[LEN];
	char *ch,*p;
	int i;	

	memset(rec.addr,0,sizeof(rec.addr));
	memset(line,0,sizeof(line));

 	sprintf(evbuf,"%s%s",evf,BLCNAME);
    fp = fopen(evbuf,"r");
    if(!fp) fprintf(stderr,"can not read file %s  error:%s\n",evbuf,strerror(errno));

	while( fgets(line,sizeof(line),fp)) {
		ch = strchr(line,',');
		if (!ch)continue;
		(*ch) = '\0';
		
		strcpy(cidr,line);
		strcpy(metric,ch+1);

		get_mask(cidr,sip,mask);	
		rec.masklen = (int16_t)atoi(mask);
		rec.flags = 0;
		for ( i = 0; i < map_dc.size() ; i++) {
			if ((atoi(metric) - loc_start) == i) 
				rec.metric[i] = 0;
	 	    else  
				rec.metric[i] = 1; 
			
		}
		
		i = 0;
		ch = sip;
		p = sip;
		while((i < 3)&&(ch)) {
			ch = strchr(ch,'.');	
			(*ch) = '\0';
			rec.addr[i++] = atoi(p); 
			ch = ch+1;
			p = ch;
		}
		rec.addr[i] = atoi(ch);

		fwrite(&rec,sizeof(rec),1,ufp);		
		memset(rec.addr,0,sizeof(rec.addr));
	}

	fclose(fp);
		
	return 0;
}

int pack_datacenter() {
	std::map<int,std::string>::iterator it;
	char *p;
	int i;
	unsigned long flag = 0;
	
	memset(datacenter,0,sizeof(datacenter));

	p = datacenter;
	
	for (i = 0;i < MAX_ELEM ; i++) {
		it = map_dc.find(i);
		if (it == map_dc.end()) continue;
		flag++;
		if (flag == 1) loc_start = i;
	   	strcpy(p,(*it).second.c_str());	
	   	p = p + strlen((*it).second.c_str())+1;
	} 

	fwrite(datacenter,sizeof(datacenter),1,ufp);

	return 0;
}

int pack_head() {
	struct MMD_Hdr head;

	
	head.magic = 0x41436d46;
	head.version = 1;
	head.ipver = 4;
	head.rec_size = sizeof(struct MMD_Rec);
	head.datacenter_start = sizeof(struct MMD_Hdr);
	head.n_datacenter = map_dc.size();
	head.recs_start = sizeof(struct MMD_Hdr) + DC_LEN; 	
	head.n_recs = num_rec;
	
	fwrite(&head,sizeof(head),1,ufp);

	printf("head.version=%d",head.version);
	printf("head.ipver=%d",head.ipver);
	printf("head.rec_size=%d\n",head.rec_size);
	printf("head.datacenter_start=%d\n",head.datacenter_start);
	printf("head.n_datacenter =%d\n",head.n_datacenter);
	printf("head.resc_start=%d\n",head.recs_start);
	printf("head.n_recs=%d\n",head.n_recs);
	return 0;
}

