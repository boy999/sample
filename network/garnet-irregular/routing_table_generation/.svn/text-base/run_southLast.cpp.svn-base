#include <iostream>
#include <fstream>
#include <string>
#include "dgraph.h"
#include "dijkstra.h" 

using namespace std;

int main(int argc, char* argv[])
{
	char* infile = argv[1];
	int nShortcuts = atoi(argv[2]);
  char* profile = argv[3];
  char* criticalfile = argv[4];
	char* outfile = argv[5];
  char* splitted_channel_file = argv[6];

  Dijkstra *dijkstra_inst = new Dijkstra(infile, outfile, profile, criticalfile, splitted_channel_file, nShortcuts);
 
  dijkstra_inst->SouthLast();
  dijkstra_inst->Construct_Routing_Table(profile);
}
