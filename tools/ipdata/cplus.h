#ifndef __CPLUS_H__
#define __CPLUS_H__
#include<map>
#include<string>

extern std::map<int,std::string> map_dc;
int map_datacenter(std::map<int,std::string> &mp,char *key,char *value);

#endif
