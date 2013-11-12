#ifndef __PACK_H__
#define __PACK_H__

#define MAX_ELEM 128
#define DC_LEN 128*256
#define CONFIG "config.ini"
#define BLCNAME "blc.csv"
#define LOCNAME "loc.csv"
#define LEN 256
#define OUTFILE "dns_mm_ipv4.mdb"
#define BLCSQL "select cidr,locId from cdn order by startipnum asc;"

#include <sys/types.h>


typedef unsigned int  uint32_t;
typedef unsigned long long int uint64_t;
typedef unsigned short int uint16_t;

struct MMD_Hdr {
    uint32_t magic;
    uint32_t version;

    int32_t ipver;
    int32_t rec_size;

    int64_t datacenter_start;
    int64_t n_datacenter;

    int64_t recs_start;
    int64_t n_recs;
};


struct MMD_Rec {
    unsigned char addr[8];

    int16_t masklen;
    uint16_t flags;
    int32_t metric[MAX_ELEM];
};


extern char datacenter[DC_LEN];
extern char evf[LEN];
extern int64_t num_rec ;
extern int loc_start;


extern FILE *ufp;
int pack_head();
int pack_datacenter();
int pack_rec();

#endif 
