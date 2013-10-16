#ifndef HEADERS_H
#define HEADERS_H 1

#include <fstream>
#include<iostream>

#include<math.h>
#include<stdio.h>
#include<assert.h>
#include<stdlib.h>

#include<vector>
#include<set>
#include<string>
#include<map>
#include<list>

#include<algorithm>
#include<sstream>

#define UNASSIGNED 100000

#define IGNORE_PORTS 1

using namespace std;

template<class T>
inline bool NOTFOUND(set<T> s, T x)
{
	return (s.find(x) == s.end());
}

template<class T, class X>
inline bool NOTFOUND(map<T, X> s, T x)
{
	return (s.find(x) == s.end());
}

template<class T>
bool NOTFOUND(vector<T> s, T x)
{
	for(unsigned i = 0;i < s.size();++i)
		if(s[i] == x)
			return false;
	return true;
}

#define min(X,Y) ((X < Y) ? X : Y)

#endif
