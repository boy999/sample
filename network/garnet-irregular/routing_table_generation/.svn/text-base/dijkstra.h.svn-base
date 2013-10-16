// The ACES (Application-specific Cycle Elimination and Splitting) algorithm implementation uses the graph data structure of // the Dijkstra algorithm implementation provided by Shane Saunders

#ifndef DIJKSTRA_H
#define DIJKSTRA_H
#include <iostream>
#include <fstream>
#include <vector>
#include "dgraph.h"

using namespace std;

#define MESHDIM 4
#define MESHSIZE (MESHDIM*MESHDIM)
#define MAXPORT 8

enum bound {upperbound, lowerbound};
enum turn {etos, stow, wton, ntoe, wtos, stoe, eton, ntow, etor, stor, wtor, ntor};
enum edge_direction {local, east, west, south, north, rfi};

typedef struct _net{
  int src;
  int dest;
  double weight;
  bool critical;
} net;

class FHeap;      // Heap
class DGraph;    // Graph

class Dijkstra {
  public:
    Dijkstra(char* infile, char* outfile, char* profile, char* critical_paths, char* f_splitted_channels, int nShortcut);
    ~Dijkstra();

    //void init();
    void SouthLast(void); // Generate Acyclic CDG of south-last routing

    void FullAdaptive(void); // Generate CDG of full-adaptive routing
    
    void shortest_path(int n); // for each pair of nodes, generate all the possible shortest paths
    
    void EdgeWeight_Update(int n); // Edge weight update
    
    void Construct_Routing_Table(char* profile); // Routing table construction
    
    int direction(int vertexNo); // mapping of directions to Garnet 

    void Even_Odd_remove(void); // Generate Acyclic CDG of even-odd routing

    double Mesh_adaptiveness(char* profile); 

    bool cycle_detection(int n); // Return true if there is a cycle, and the cycle will be stored in the vector of cycle;

    bool DFS_visit(int n, int v);

    void Minimal_Feedback_Edge_Set(void); // ACES algorithm

    unsigned long long factorial(unsigned long long n);
  private:
    FHeap *heap;        // pointer: heap
    vector<bool> s;           // array: solution set state of vertices
    vector<bool> f;           // array: frontier set state of vertices

    vector<vector<long> > d;           // array: length of the shortest path
    
    vector<vector<int> > nSP;            // 2-D array: the number of shortest path

    vector<vector<vector<int> > > pNode;  // 3-D array: all the parent nodes of j in the shortest paths from i to j;

    vector<int> cycle;

    ofstream fout;

    vector<vector<net> > profiling;
    vector<net> criticalPath;

    ofstream f_splitted_channels;

    vector<Shortcut> vShortcut;
    vector<int> splitted_channels;

    int original_edges;

    int time; // used for DFS
    vector<int> pre;
    vector<int> post;
    vector<bool> visited;
    vector<int> parent;
    
    DGraph *graph;    // pointer: directed graph    
	  //vector<vector<DGraphVertex> > path;  //2-D array: store the shortest path from the source node
};


#endif
