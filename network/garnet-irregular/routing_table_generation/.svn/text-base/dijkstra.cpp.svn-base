#include <assert.h>
#include <vector>
#include <list>
#include <iostream>
#include <fstream>
#include <cmath>
#include "dijkstra.h"
#include "dgraph.h"
#include "fheap.h"

using namespace std;

#define SINK_BASE (MESHDIM*MESHDIM)
#define EAST_BASE (2*MESHDIM*MESHDIM)
#define WEST_BASE (EAST_BASE + MESHDIM*(MESHDIM-1))
#define SOUTH_BASE (WEST_BASE + MESHDIM*(MESHDIM-1))
#define NORTH_BASE (SOUTH_BASE + MESHDIM*(MESHDIM-1))
#define END_BASE (NORTH_BASE + MESHDIM*(MESHDIM-1))

int Dijkstra::direction(int vertex)
{ 
  // The direction index follows the order of the enum outPortMap in NetworkDefine.h of Garnet code
  if(vertex >= 2*(END_BASE + vShortcut.size()))
    return 2*MAXPORT + direction(splitted_channels.at(vertex - 2*(END_BASE+vShortcut.size())));
  else if(vertex >= END_BASE + vShortcut.size())
    return MAXPORT + direction(splitted_channels.at(vertex - END_BASE - vShortcut.size()));
  else if(vertex >= END_BASE) // RF
    return 5;
  else if(vertex >= NORTH_BASE) // N
    return 1;
  else if(vertex >= SOUTH_BASE) // S
    return 2;
  else if(vertex >= WEST_BASE) // W
    return 4;
  else if(vertex >= EAST_BASE) // E
    return 3;
  else if(vertex >= SINK_BASE) // Local
    return 0;
  else
    return -5;
}

Dijkstra::Dijkstra(char* infile, char* outfile, char* profile, char* critical_path,  char* splitted_channel_file, int nShortcut)
{
  // Read the profiling file
  ifstream fpro;
  fpro.open(profile);
  int nPhases, nNets;
  int src, dest;
  double weight;
  net netTemp;
  fpro>>nPhases;

  for(int p =0; p<nPhases; p++)
  {
    vector<net> vnet;
    fpro>>nNets;
    for(int nets=0; nets<nNets; nets++)
    {
      fpro>>src>>dest>>weight;
      netTemp.src = src;
      netTemp.dest = dest;
      netTemp.weight = weight;
      netTemp.critical = false;
      vnet.push_back(netTemp);
    }
    profiling.push_back(vnet);
  }

  fpro.close();

  // Read the critical path file
  ifstream fcrit;
  fcrit.open(critical_path);
  int nCriticalPath;
  fcrit>>nCriticalPath;
  int phase;

  for(int nc = 0; nc<nCriticalPath; nc++)
  {
    fcrit>>phase>>src>>dest;
    vector<net>::iterator ip;
    for(ip = profiling.at(phase).begin(); ip != profiling.at(phase).end(); ++ip)
    {
      if((*ip).src == src && (*ip).dest == dest)
      {
        (*ip).critical = true;
        break;
      }
    }
  }

  fcrit.close();

  // Construct the graph
  ifstream fin;
  fin.open(infile);

  fout.open(outfile);
  f_splitted_channels.open(splitted_channel_file);

  int i, size;
  for(i=0; i<nShortcut; i++)
  {
    Shortcut scut;
    fin>> scut.src_h>> scut.src_v >> scut.dest_h >> scut.dest_v>> size;
    vShortcut.push_back(scut);
  }
  vector<Shortcut>::iterator scutIter;

  int j;
  DGraphVertex *vertices;

  // The total number of vertices in the turn model graph is the original physical network links and the shortcuts
  heap = new FHeap(2*(END_BASE + nShortcut));

  for(i=0; i<2*(END_BASE + nShortcut); i++)
  {
    vector<int> temp(2*(END_BASE + nShortcut), 0);
    nSP.push_back(temp);
    vector<long> temp3(2*(END_BASE + nShortcut), 0);
    d.push_back(temp3);
  }
  
  for(i=0; i<2*(END_BASE + nShortcut); i++)
  {
    vector<vector<int> > temp1;
    for(j=0; j<2*(END_BASE + nShortcut); j++)
    {
      vector<int> temp2;
      temp1.push_back(temp2);
    }
    pNode.push_back(temp1);
  }
  
  graph = new DGraph(2*(END_BASE + nShortcut));

  vertices = graph->vertices;

  // Add the edges from all the source nodes

  for(i=0; i<MESHDIM*MESHDIM; i++)
  {
    if(i == 0)
    {
      graph->addNewEdge(i, EAST_BASE + i, 1);
      graph->addNewEdge(i, SOUTH_BASE + i, 1);
    }
    else if (i == MESHDIM-1)
    {
      graph->addNewEdge(i, WEST_BASE + i - 1, 1);
      graph->addNewEdge(i, SOUTH_BASE + i, 1);
    }
    else if (i == MESHDIM*(MESHDIM-1))
    {
      graph->addNewEdge(i, EAST_BASE + (i/MESHDIM)*(MESHDIM-1)+i%MESHDIM , 1);
      graph->addNewEdge(i, NORTH_BASE + i - MESHDIM , 1);
    }
    else if (i == MESHDIM*MESHDIM-1)
    {
      graph->addNewEdge(i, WEST_BASE + (i/MESHDIM)*(MESHDIM-1)+i%MESHDIM - 1 , 1);
      graph->addNewEdge(i, NORTH_BASE + i - MESHDIM , 1);
    }
    else if (i/MESHDIM == 0)
    {
      graph->addNewEdge(i, WEST_BASE + i - 1, 1);
      graph->addNewEdge(i, EAST_BASE + i, 1);
      graph->addNewEdge(i, SOUTH_BASE + i, 1);
    }
    else if (i/MESHDIM == MESHDIM-1)
    {
      graph->addNewEdge(i, WEST_BASE + (i/MESHDIM)*(MESHDIM-1)+i%MESHDIM - 1 , 1);
      graph->addNewEdge(i, EAST_BASE + (i/MESHDIM)*(MESHDIM-1)+i%MESHDIM , 1);
      graph->addNewEdge(i, NORTH_BASE + i - MESHDIM , 1);
    }
    else if (i%MESHDIM == 0)
    {
      graph->addNewEdge(i, NORTH_BASE + i - MESHDIM , 1);
      graph->addNewEdge(i, EAST_BASE + (i/MESHDIM)*(MESHDIM-1)+i%MESHDIM , 1);
      graph->addNewEdge(i, SOUTH_BASE + i, 1);
    }
    else if (i%MESHDIM == MESHDIM-1)
    {
      graph->addNewEdge(i, WEST_BASE + (i/MESHDIM)*(MESHDIM-1)+i%MESHDIM - 1 , 1);
      graph->addNewEdge(i, NORTH_BASE + i - MESHDIM , 1);
      graph->addNewEdge(i, SOUTH_BASE + i, 1);
    }
    else
    {
      graph->addNewEdge(i, EAST_BASE + (i/MESHDIM)*(MESHDIM-1)+i%MESHDIM , 1);
      graph->addNewEdge(i, WEST_BASE + (i/MESHDIM)*(MESHDIM-1)+i%MESHDIM - 1 , 1);
      graph->addNewEdge(i, NORTH_BASE + i - MESHDIM , 1);
      graph->addNewEdge(i, SOUTH_BASE + i, 1);
    }
  }

  // Add the edges from all the south nodes

  for(i=SOUTH_BASE; i<NORTH_BASE; i++)
  {
    if((i-SOUTH_BASE)%MESHDIM == 0)
    {
      graph->addNewEdge(i, SINK_BASE + (i-SOUTH_BASE) + MESHDIM, 1);
      graph->addNewEdge(i, EAST_BASE + ((i-SOUTH_BASE)/MESHDIM + 1)*(MESHDIM-1) + (i-SOUTH_BASE)%MESHDIM, 1);
    }
    else if((i-SOUTH_BASE)%MESHDIM == MESHDIM-1)
    {
      graph->addNewEdge(i, SINK_BASE + (i-SOUTH_BASE) + MESHDIM, 1);
      //if(((i-SOUTH_BASE)%MESHDIM)%2 != 0)
      graph->addNewEdge(i, WEST_BASE + ((i-SOUTH_BASE)/MESHDIM + 1)*(MESHDIM-1) + (i-SOUTH_BASE)%MESHDIM - 1, 1);
    }
    else
    {
      graph->addNewEdge(i, SINK_BASE + (i-SOUTH_BASE) + MESHDIM, 1);
      graph->addNewEdge(i, EAST_BASE + ((i-SOUTH_BASE)/MESHDIM + 1)*(MESHDIM-1) + (i-SOUTH_BASE)%MESHDIM, 1);
      //if(((i-SOUTH_BASE)%MESHDIM)%2 != 0)
      graph->addNewEdge(i, WEST_BASE + ((i-SOUTH_BASE)/MESHDIM + 1)*(MESHDIM-1) + (i-SOUTH_BASE)%MESHDIM - 1, 1);
    }
    // add horizontal edges
    if((i-SOUTH_BASE)/MESHDIM != MESHDIM-2)
    {
      graph->addNewEdge(i, i+MESHDIM, 1);
    }
  }

  // Add the edges from all the north nodes

  for(i=NORTH_BASE; i<END_BASE; i++)
  {
    if((i-NORTH_BASE)%MESHDIM == 0)
    {
      graph->addNewEdge(i, SINK_BASE + (i-NORTH_BASE), 1);
      graph->addNewEdge(i, EAST_BASE + ((i-NORTH_BASE)/MESHDIM)*(MESHDIM-1) + (i-NORTH_BASE)%MESHDIM, 1);
    }
    else if((i-NORTH_BASE)%MESHDIM == MESHDIM-1)
    {
      graph->addNewEdge(i, SINK_BASE + (i-NORTH_BASE), 1);
      //if(((i-NORTH_BASE)%MESHDIM)%2 != 0)
      graph->addNewEdge(i, WEST_BASE + ((i-NORTH_BASE)/MESHDIM)*(MESHDIM-1) + (i-NORTH_BASE)%MESHDIM - 1, 1);
    }
    else
    {
      graph->addNewEdge(i, SINK_BASE + (i-NORTH_BASE), 1);
      graph->addNewEdge(i, EAST_BASE + ((i-NORTH_BASE)/MESHDIM)*(MESHDIM-1) + (i-NORTH_BASE)%MESHDIM, 1);
      //if(((i-NORTH_BASE)%MESHDIM)%2 != 0)
      graph->addNewEdge(i, WEST_BASE + ((i-NORTH_BASE)/MESHDIM)*(MESHDIM-1) + (i-NORTH_BASE)%MESHDIM - 1, 1);
    }
    // add horizontal edges
    if((i-NORTH_BASE)/MESHDIM != 0)
    {
      graph->addNewEdge(i, i-MESHDIM, 1);
    }
  }

  // Add the edges from all the west nodes

  for(i=WEST_BASE; i<SOUTH_BASE; i++)
  {
    if((i-WEST_BASE)/(MESHDIM-1) == 0)
    {
      graph->addNewEdge(i, SINK_BASE + i-WEST_BASE, 1);
      graph->addNewEdge(i, SOUTH_BASE+i-WEST_BASE, 1);
    }
    else if((i-WEST_BASE)/(MESHDIM-1) == MESHDIM-1)
    {
      graph->addNewEdge(i, SINK_BASE + ((i-WEST_BASE)/(MESHDIM-1))*MESHDIM + (i-WEST_BASE)%(MESHDIM-1), 1);
      graph->addNewEdge(i, NORTH_BASE + ((i-WEST_BASE)/(MESHDIM-1)-1)*MESHDIM + (i-WEST_BASE)%(MESHDIM-1), 1);
    }
    else
    {
      graph->addNewEdge(i, SINK_BASE + ((i-WEST_BASE)/(MESHDIM-1))*MESHDIM + (i-WEST_BASE)%(MESHDIM-1), 1);
      graph->addNewEdge(i, SOUTH_BASE + ((i-WEST_BASE)/(MESHDIM-1))*MESHDIM + (i-WEST_BASE)%(MESHDIM-1), 1);
      graph->addNewEdge(i, NORTH_BASE + ((i-WEST_BASE)/(MESHDIM-1)-1)*MESHDIM + (i-WEST_BASE)%(MESHDIM-1) , 1);
    }
    // add horizontal edges
    if((i-WEST_BASE)%(MESHDIM-1) != 0)
    {
      graph->addNewEdge(i, i-1, 1);
    }
  }

  // Add the edges from all the east nodes

  for(i=EAST_BASE; i<WEST_BASE; i++)
  {
    if((i-EAST_BASE)/(MESHDIM-1) == 0)
    {
      graph->addNewEdge(i, SINK_BASE + (i-EAST_BASE)+1, 1);
      //if(((i-EAST_BASE)%(MESHDIM-1))%2 != 0)
      graph->addNewEdge(i, SOUTH_BASE + (i-EAST_BASE)+1 , 1);
    }   
    else if((i-EAST_BASE)/(MESHDIM-1) == MESHDIM-1)
    {
      graph->addNewEdge(i, SINK_BASE + ((i-EAST_BASE)/(MESHDIM-1))*MESHDIM + (i-EAST_BASE)%(MESHDIM-1) + 1 , 1);
      //if(((i-EAST_BASE)%(MESHDIM-1))%2 != 0)  
      graph->addNewEdge(i, NORTH_BASE + ((i-EAST_BASE)/(MESHDIM-1)-1)*MESHDIM + (i-EAST_BASE)%(MESHDIM-1) + 1 , 1);
    }   
    else
    {
      graph->addNewEdge(i, SINK_BASE + ((i-EAST_BASE)/(MESHDIM-1))*MESHDIM + (i-EAST_BASE)%(MESHDIM-1) + 1 , 1);
      //if(((i-EAST_BASE)%(MESHDIM-1))%2 != 0)
      //{
      graph->addNewEdge(i, SOUTH_BASE + ((i-EAST_BASE)/(MESHDIM-1))*MESHDIM + (i-EAST_BASE)%(MESHDIM-1) + 1 , 1);
      graph->addNewEdge(i, NORTH_BASE + ((i-EAST_BASE)/(MESHDIM-1)-1)*MESHDIM + (i-EAST_BASE)%(MESHDIM-1) + 1 , 1);
      //}
    } 
    // add horizontal edges
    if((i-EAST_BASE)%(MESHDIM-1) != MESHDIM-2)
    {
      graph->addNewEdge(i, i+1, 1);
    } 
  }


  //Add Shortcuts

  i=0;
  for(scutIter = vShortcut.begin(); scutIter != vShortcut.end(); ++scutIter)
  {
    int scut_src = (*scutIter).src_h * MESHDIM + (*scutIter).src_v;
    int scut_dest = (*scutIter).dest_h * MESHDIM + (*scutIter).dest_v;

    graph->addNewEdge(scut_src, END_BASE+i, 1);
    if((*scutIter).src_h > 0)
    {
      // The source router has north input port, which is an south edge node
      graph->addNewEdge(SOUTH_BASE + scut_src - MESHDIM, END_BASE+i, 1);
    }
    if((*scutIter).src_h < MESHDIM - 1)
    {
      // The source router has south input port, which is an north edge node
      graph->addNewEdge(NORTH_BASE + scut_src, END_BASE+i, 1);
    }
    if((*scutIter).src_v < MESHDIM - 1)
    {
      // The source router has east input port, which is an west edge node
      graph->addNewEdge(WEST_BASE + (*scutIter).src_h*(MESHDIM-1) + (*scutIter).src_v, END_BASE+i, 1);
    } 
    if((*scutIter).src_v > 0)
    {
      // The source router has west input port, which is an east edge node
      graph->addNewEdge(EAST_BASE + (*scutIter).src_h*(MESHDIM-1) + (*scutIter).src_v - 1, END_BASE+i, 1);
    }

    graph->addNewEdge(END_BASE+i, scut_dest+MESHDIM*MESHDIM, 1);
    if((*scutIter).dest_h > 0)
    {
      // The dest router has north output port, which is an north edge node
      graph->addNewEdge(END_BASE+i, NORTH_BASE + scut_dest - MESHDIM, 1);
    } 
    if((*scutIter).dest_h < MESHDIM - 1)
    {
      // The dest router has south output port, which is an south edge node
      graph->addNewEdge(END_BASE+i, SOUTH_BASE + scut_dest, 1);
    } 
    if((*scutIter).dest_v < MESHDIM - 1)
    {
      // The dest router has east output port, which is an east edge node
      graph->addNewEdge(END_BASE+i, EAST_BASE +  (*scutIter).dest_h*(MESHDIM-1) + (*scutIter).dest_v, 1);
    } 
    if((*scutIter).dest_v > 0)
    {
      // The dest router has west output port, which is an west edge node
      graph->addNewEdge(END_BASE+i, WEST_BASE + (*scutIter).dest_h*(MESHDIM-1) + (*scutIter).dest_v - 1, 1);
    } 

    i++;
  }

  original_edges = graph->nEdges;
  fin.close();
  cout<<"graph building complete"<<endl;
}

/* - Destructor - */
Dijkstra::~Dijkstra() {
  delete heap;
  delete graph;
  fout.close();
  f_splitted_channels.close();
}

void Dijkstra::Even_Odd_remove(void)
{
  int i;

  for(i=EAST_BASE; i<WEST_BASE - (MESHDIM-1); i++)
  {
    if(((i-EAST_BASE)%(MESHDIM-1))%2 == 0)
      graph->removeEdge(i, SOUTH_BASE + ((i-EAST_BASE)/(MESHDIM-1))*MESHDIM + (i-EAST_BASE)%(MESHDIM-1) + 1);
  }

  for(i=EAST_BASE + (MESHDIM-1); i<WEST_BASE; i++)
  {
    if(((i-EAST_BASE)%(MESHDIM-1))%2 == 0)
      graph->removeEdge(i, NORTH_BASE + ((i-EAST_BASE)/(MESHDIM-1)-1)*MESHDIM + (i-EAST_BASE)%(MESHDIM-1) + 1);
  }

  for(i=SOUTH_BASE; i<NORTH_BASE; i++)
  {
    if(((i-SOUTH_BASE)%MESHDIM)%2 == 0 && (i-SOUTH_BASE)%MESHDIM > 0)
      graph->removeEdge(i, WEST_BASE + ((i-SOUTH_BASE)/MESHDIM + 1)*(MESHDIM-1) + (i-SOUTH_BASE)%MESHDIM - 1);
  }

  for(i=NORTH_BASE; i<END_BASE; i++)
  {
    if(((i-NORTH_BASE)%MESHDIM)%2 == 0 && (i-NORTH_BASE)%MESHDIM > 0)
      graph->removeEdge(i, WEST_BASE + ((i-NORTH_BASE)/MESHDIM)*(MESHDIM-1) + (i-NORTH_BASE)%MESHDIM - 1);
  }
}

void Dijkstra::FullAdaptive(void)
{
  int n = END_BASE + vShortcut.size();
  shortest_path(n);
  EdgeWeight_Update(n);
}

void Dijkstra::SouthLast(void)
{
  int n = END_BASE + vShortcut.size();
  DGraphVertex *vertices = graph->vertices;
  DGraphEdge *edge;

  int i;
  for(i = SOUTH_BASE; i < NORTH_BASE; i++)
  {
    edge = vertices[i].outHead;
    while(edge)
    {
      if(edge->target >= EAST_BASE && edge->target < SOUTH_BASE)
        graph->removeEdge(i, edge->target);
      edge = edge->nextOut;
    }
  }

  i = 0;
  vector<Shortcut>::iterator scutIter;
  for(scutIter = vShortcut.begin(); scutIter != vShortcut.end(); ++scutIter)
  {
    if((*scutIter).src_h < (*scutIter).dest_h)
    {
      // South bound
      edge = vertices[END_BASE+i].outHead;
      while(edge)
      {
        if((edge->target >= EAST_BASE && edge->target < SOUTH_BASE) || (edge->target >= NORTH_BASE))
          graph->removeEdge(END_BASE+i, edge->target);
        edge = edge->nextOut;
      }
    }
    else
    {
      // North Bound and horizontal
      edge = vertices[END_BASE+i].inHead;
      while(edge)
      {
        if(edge->source >= SOUTH_BASE && edge->source < NORTH_BASE)
          graph->removeEdge(edge->source, END_BASE+i);
        edge = edge->nextIn;
      }
      edge = vertices[END_BASE+i].outHead;
      while(edge)
      {
        if(edge->target >= END_BASE)
          graph->removeEdge(END_BASE+i, edge->target);
        edge = edge->nextOut;
      }
    }
    i++;
  }

  shortest_path(n);
  EdgeWeight_Update(n);
}

void Dijkstra::shortest_path(int n)
{
  int v0;
  //const int n = nodes;
  const int e = graph->nEdges;
  //cout<<"The graph has "<<n<<" vertices and "<<e<<" edges"<<endl;
  const DGraphVertex *vertices = graph->vertices;

  // Reconstruct the nSP and the pNode

  int i, j;
  for(i=0; i < n; i++)
    for(j=0; j < n; j++)
    {
      nSP.at(i).at(j) = 0;
      d.at(i).at(j) = INFINITE_DIST;
      pNode.at(i).at(j).clear();
    }

  for(v0 = 0; v0 < n; v0++)
  {
    /* indexes, counters, pointers */
    int v, w;
    long dist;
    const DGraphEdge *edge;

    //assert(graph->reachable(v0));

    /* initialise all vertices as unexplored */
    s.assign(n, false);
    f.assign(n, false);
    
    /* place v0 into the frontier set with a distance of zero */
    d.at(v0).at(v0) = 0; // The distance from a node to itself is 0
    nSP.at(v0).at(v0) = 1; // There is only one shortest path from a node to itself
    heap->insert(v0, 0);
    f.at(v0) = true; // v0 is found

    /* repeatedly update distances from the minimum remaining trigger vertex */
    while(heap->nItems() > 0) {
      /* delete the vertex in frontier that has minimum distance */
      v = heap->deleteMin();

      /* the selected vertex moves from the frontier to the solution set */
      s.at(v) = true; //v is explored
      f.at(v) = false;

      /* explore the OUT set of v */
      edge = vertices[v].outHead;
      while(edge) {
        w = edge->target;
        assert(w != -1 && w < 2*(END_BASE + vShortcut.size()));

        if(s.at(w) == false) {
          dist = d.at(v0).at(v) + edge->dist;
          if(dist < d.at(v0).at(w)) 
          {
            d.at(v0).at(w) = dist;
            
            nSP.at(v0).at(w) = nSP.at(v0).at(v);
            pNode.at(v0).at(w).clear();
            pNode.at(v0).at(w).push_back(v);
            
            if(f[w]) 
            {
              // w is a node already found
              heap->decreaseKey(w, dist);
            }
            else 
            {
              // w is the first time to be found
              heap->insert(w, dist);
              f.at(w) = true;
            }
          }
          else if(dist == d.at(v0).at(w))
          {
            nSP.at(v0).at(w) = nSP.at(v0).at(w) + nSP.at(v0).at(v);
            pNode.at(v0).at(w).push_back(v);
          }
        }

        edge = edge->nextOut;
      } /* while */
    } /* while */
  }
}

bool Dijkstra::cycle_detection(int n)
{
  // DFS from v
  //const int n = END_BASE + vShortcut.size() ;
  const DGraphVertex *vertices = graph->vertices;

  // Initialize
  pre.clear();
  post.clear();
  visited.clear();
  parent.clear();
  cycle.clear();
  
  pre.assign(n, -1);
  post.assign(n, -1);
  visited.assign(n, false);
  parent.assign(n, -1);

  time = 0;

  int i;
  for(i=0; i<n; i++)
  {
    if(visited.at(i) == false)
      if(!DFS_visit(i, n))
      {
        cout<<"cycle detected"<<endl;
        return false;
      }
  }

  return true;
}

bool Dijkstra::DFS_visit(int v, int n)
{
  time++;
  visited.at(v) = true;
  pre.at(v) = time;

 // const int n = END_BASE + vShortcut.size();
  const DGraphVertex *vertices = graph->vertices;
  
  const DGraphEdge *edge;
  edge = vertices[v].outHead;

  ////cout<<"DFS from "<<v<<endl;
  int u;
  
  while(edge)
  {
    u = edge->target;
    if(visited.at(u) == false)
    {
      parent.at(u) = v;
      if(!DFS_visit(u, n))
        return false;
    }
    else
    {
      if(pre.at(u) >= 0 && post.at(u) == -1)
      {
        // Back edge detected
        
        // Print the cycle into the cycle vector
        cout<<"Cycle: ";
        int temp = v;
        while(temp != u)
        {
          cycle.push_back(temp);
          cout<<temp<<" ";
          assert(parent.at(temp) >= 0);
          temp = parent.at(temp);
        }
        cycle.push_back(u);
        cout<<u<<endl;
        return false;
      }

      edge = edge->nextOut;
    }
    time++;
    post.at(u) = time;
  }

  return true;
}

void Dijkstra::Minimal_Feedback_Edge_Set(void)
{
  int n = END_BASE + vShortcut.size();
  DGraphVertex *vertices = graph->vertices;
  DGraphEdge *edge;
  DGraphEdge *edge2;

  vector<nodepair> FES;
  vector<nodepair> locked_FES;
  nodepair temp;

  shortest_path(n);
  EdgeWeight_Update(n);

  while(!cycle_detection(n))
  {
    // Find the minimal edge weight in the cycle
    double min_weight = 1.0e30;
    int min_src = 0;
    int min_target = 0;

    for(int i = cycle.size()-1; i>0; i--)
    {
      edge = vertices[cycle.at(i)].outHead;
      while(edge->target != cycle.at(i-1))
        edge = edge->nextOut;
      if((edge->weight - edge->weightToBeReduced) < min_weight && edge->locked == false)
      {
        min_weight = edge->weight - edge->weightToBeReduced;
        min_src = cycle.at(i);
        min_target = cycle.at(i-1);
      }
    }

    edge = vertices[cycle.at(0)].outHead;
    while(edge->target != cycle.at(cycle.size()-1))
      edge = edge->nextOut;
    if((edge->weight - edge->weightToBeReduced) < min_weight && edge->locked == false)
    {
      min_weight = edge->weight - edge->weightToBeReduced;
      min_src = cycle.at(0);
      min_target = cycle.at(cycle.size()-1);
    }

    if(min_src == 0 && min_target == 0)
    {
      // This is a very special case that all the edges in a cycle are previously locked
      for(int i = cycle.size()-1; i>0; i--)
      {
        edge = vertices[cycle.at(i)].outHead;
        while(edge->target != cycle.at(i-1))
          edge = edge->nextOut;
        if((edge->weight - edge->weightToBeReduced)< min_weight)
        {
          min_weight = edge->weight;
          min_src = cycle.at(i);
          min_target = cycle.at(i-1);
        }
      }

      edge = vertices[cycle.at(0)].outHead;
      while(edge->target != cycle.at(cycle.size()-1))
        edge = edge->nextOut;
      if((edge->weight - edge->weightToBeReduced)< min_weight)
      {
        min_weight = edge->weight;
        min_src = cycle.at(0);
        min_target = cycle.at(cycle.size()-1);
      }

      temp.src = min_src;                 
      temp.target = min_target;     
      locked_FES.push_back(temp);
      graph->removeEdge(min_src, min_target);

      cout<<"A locked edge is removed: "<<min_src<<" "<<min_target<<endl;
    }
    else
    {
      // Update the edge weight in the cycle
      for(int i = cycle.size()-1; i>0; i--)
      { 
        edge = vertices[cycle.at(i)].outHead;
        while(edge->target != cycle.at(i-1))
          edge = edge->nextOut;
        edge->weight -= min_weight; 
        if(edge->weight - edge->weightToBeReduced - min_weight < 0.000001 && edge->locked == false)
        {
          temp.src = cycle.at(i);
          temp.target = cycle.at(i-1);
          FES.push_back(temp);
          graph->removeEdge(cycle.at(i), cycle.at(i-1));
        }
        else
        {
          if(min_weight >= 0)
            edge->weightToBeReduced += min_weight;
        }
      }   

      edge = vertices[cycle.at(0)].outHead;
      while(edge->target != cycle.at(cycle.size()-1))
        edge = edge->nextOut;
      edge->weight -= min_weight;
      if(edge->weight - edge->weightToBeReduced - min_weight < 0.000001 && edge->locked == false)
      {
        temp.src = cycle.at(0);
        temp.target = cycle.at(cycle.size()-1);
        FES.push_back(temp);
        graph->removeEdge(cycle.at(0), cycle.at(cycle.size()-1));
      }
      else
      {
        if(min_weight >= 0)
          edge->weightToBeReduced += min_weight;
      }
    }

    shortest_path(n);
    EdgeWeight_Update(n);
  }

  // Adding redundantly removed edges
  
  int nEdges = FES.size();
  vector<nodepair> EdgeRemoved;
  vector<nodepair>::iterator itr;

  for(itr = locked_FES.begin(); itr != locked_FES.end();)
  {
    graph->addNewEdge((*itr).src, (*itr).target, 1);
    if(!cycle_detection(n))
    {   
      graph->removeEdge((*itr).src, (*itr).target);
      ++itr;
    }   
    else
    {   
      itr = locked_FES.erase(itr);
      cout<<(*itr).src<<" "<<(*itr).target<<" is added back"<<endl;
    }
  }

  for(itr = FES.begin(); itr != FES.end(); ++itr)
  {
    graph->addNewEdge((*itr).src, (*itr).target, 1);
    if(!cycle_detection(n))
    {
      graph->removeEdge((*itr).src, (*itr).target);
      EdgeRemoved.push_back(*itr);
    }
    else
    {
      nEdges--;
      cout<<(*itr).src<<" "<<(*itr).target<<" is added back"<<endl;
    }
  }

  vector<nodepair> still_locked_FES = locked_FES;

  int i;
   /******************************************************************************************
  while(locked_FES.size() != 0)
  {
    nodepair max_cycle_pair;
    int max_cycle = 0;
    vector<nodepair> temp_removed_edge;

    for(itr = locked_FES.begin(); itr != locked_FES.end(); ++itr)
    { 
      graph->addNewEdge((*itr).src, (*itr).target, 1);
      if(!cycle_detection())
      {
        if(max_cycle < cycle.size())
        {
          max_cycle = cycle.size();
          max_cycle_pair = (*itr);
        }
      }
      else
      {
        //cout<<"Error: a critical edge not resulting in a cycle should be removed!"<<endl;
      }
      graph->removeEdge((*itr).src, (*itr).target);
    }

    graph->addNewEdge(max_cycle_pair.src, max_cycle_pair.target, 1);

    // clear all the edge lock information
    for(i=0; i<n; i++)
    {
      edge = vertices[i].outHead;
      while(edge != NULL)
      {
        edge->locked = false;
        edge = edge->nextOut;
      }
    }

    shortest_path();
    EdgeWeight_Update(profile);

    while(!cycle_detection())
    {
      double min_weight = 1.0e30;
      int min_src = 0;
      int min_target = 0;

      for(int i = cycle.size()-1; i>0; i--)
      {
        edge = vertices[cycle.at(i)].outHead;
        while(edge->target != cycle.at(i-1))
          edge = edge->nextOut;
        if(edge->weight < min_weight && edge->locked == false)
        {
          min_weight = edge->weight;
          min_src = cycle.at(i);
          min_target = cycle.at(i-1);
        }
      }

      edge = vertices[cycle.at(0)].outHead;
      while(edge->target != cycle.at(cycle.size()-1))
        edge = edge->nextOut;
      if(edge->weight < min_weight && edge->locked == false)
      {
        min_weight = edge->weight;
        min_src = cycle.at(0);
        min_target = cycle.at(cycle.size()-1);
      }

      // If all the edges in the cycle are still all locked, 
      if(min_src == 0 && min_target == 0)
      {
        still_locked_FES.push_back(max_cycle_pair);
        graph->removeEdge(max_cycle_pair.src, max_cycle_pair.target);
        vector<nodepair>::iterator tempitr;
        for(tempitr = temp_removed_edge.begin(); tempitr != temp_removed_edge.end(); ++tempitr)
        {
          graph->addNewEdge((*itr).src, (*itr).target, 1);
        }
        assert(cycle_detection());
      }
      else
      {
        temp.src = min_src;  
        temp.target = min_target;
        temp_removed_edge.push_back(temp);
        graph->removeEdge(min_src, min_target);
      }

      if(!(min_src == 0 && min_target == 0))
      {
        vector<nodepair>::iterator tempitr;
        for(tempitr = temp_removed_edge.begin(); tempitr != temp_removed_edge.end(); ++tempitr)
        {
          EdgeRemoved.push_back((*itr));
        }
      }
      
      shortest_path();
      EdgeWeight_Update(profile);
    }

    // Remove the max cycle pair from locked edge set
    for(itr = locked_FES.begin(); itr != locked_FES.end();)
    {
      if((*itr).src == max_cycle_pair.src && (*itr).target == max_cycle_pair.target)
      {
        //cout<<"A previsouly locked edge "<<(*itr).src<<" "<<(*itr).target<<" is processed"<<endl;
        itr = locked_FES.erase(itr);
        break;
      }
    }
  }
                                                 
  *********************************************************************************************/

  vector<int> is_node_splitted(END_BASE+vShortcut.size(), -1);
  vector<vector<int> > cycles;
  splitted_channels.clear();
  for(itr = still_locked_FES.begin(); itr != still_locked_FES.end(); ++itr)
  {
    graph->addNewEdge((*itr).src, (*itr).target, 1);
    if(!cycle_detection(n))
    {
      // #splitted vcs / #original edges
      f_splitted_channels<<cycle.size();
      cycles.push_back(cycle);
      vector<int>::iterator se_itr;
      for(se_itr = cycle.begin(); se_itr != cycle.end(); ++se_itr)
      {
        f_splitted_channels<<" "<<(*se_itr);
        if(is_node_splitted.at(*se_itr) == -1)
        {
          is_node_splitted.at(*se_itr) = END_BASE + vShortcut.size() + splitted_channels.size();
          splitted_channels.push_back(*se_itr);
        }
      }
      f_splitted_channels<<endl;
    }
    else
    {
      cout<<"Error: a critical edge not resulting in a cycle should be removed!"<<endl;
    }
    graph->removeEdge((*itr).src, (*itr).target);
  }

  cout<<"In sum "<<splitted_channels.size()<<" is splitted among "<<n<<" original channels: "<<(double)splitted_channels.size()/(double)n<<endl;

  for(itr = still_locked_FES.begin(); itr != still_locked_FES.end(); ++itr)
  {
    graph->addNewEdge((*itr).src, (*itr).target, 1);

    int node = (*itr).src;
    cout<<"A turn from ";

    if(node<EAST_BASE)
    {
      cout<<node<<" ";
    }
    else if(node<WEST_BASE)
    {
      cout<<"west "<<((node-EAST_BASE)/(MESHDIM-1))*MESHDIM + (node-EAST_BASE)%(MESHDIM-1) + 1<<" ";
    }
    else if(node<SOUTH_BASE)
    {
      cout<<"east "<<((node-WEST_BASE)/(MESHDIM-1))*MESHDIM + (node-WEST_BASE)%(MESHDIM-1)<<" ";
    }
    else if(node<NORTH_BASE)
    { 
      cout<<"north "<<(node-SOUTH_BASE) + MESHDIM<<" ";
    }
    else if(node<END_BASE)
    { 
      cout<<"south "<<(node-NORTH_BASE)<<" ";
    }
    else
    { 
      cout<<"RF "<<vShortcut.at(node-END_BASE).dest_h * MESHDIM + vShortcut.at(node-END_BASE).dest_v<<" ";
    }
    node = (*itr).target;
    if(node<EAST_BASE)
    {
      cout<<node<<" ";
    }
    else if(node<WEST_BASE)
    {
      cout<<((node-EAST_BASE)/(MESHDIM-1))*MESHDIM + (node-EAST_BASE)%(MESHDIM-1) + 1<<" ";
    }
    else if(node<SOUTH_BASE)
    {
      cout<<((node-WEST_BASE)/(MESHDIM-1))*MESHDIM + (node-WEST_BASE)%(MESHDIM-1)<<" ";
    }
    else if(node<NORTH_BASE)
    {
      cout<<(node-SOUTH_BASE) + MESHDIM<<" ";
    }
    else if(node<END_BASE)
    {
      cout<<(node-NORTH_BASE)<<" ";
    }
    else
    {
      cout<<vShortcut.at(node-END_BASE).dest_h * MESHDIM + vShortcut.at(node-END_BASE).dest_v<<" ";
    }

    cout<<"will introduce a cycle"<<endl;
  }   

  vector<int>::iterator sc_itr;
  i = END_BASE + vShortcut.size();
  for(sc_itr = splitted_channels.begin(); sc_itr != splitted_channels.end(); ++sc_itr)
  {
    edge = vertices[*sc_itr].inHead;
    while(edge)
    {
      if(is_node_splitted.at(edge->source) == -1)
        graph->addNewEdge(edge->source, i, 1);
      edge = edge->nextIn;
    }
    edge = vertices[*sc_itr].outHead;
    while(edge)
    {
      if(is_node_splitted.at(edge->target) == -1)
        graph->addNewEdge(i, edge->target, 1);
      edge = edge->nextOut;
    }
    i++;
  }

  vector<vector<int> >::iterator cycles_itr;
  for(cycles_itr = cycles.begin(); cycles_itr != cycles.end(); ++cycles_itr)
  {
    for(i = (*cycles_itr).size()-1; i>0; i--)
    {
      edge = vertices[(*cycles_itr).at(i)].outHead;
      while(edge->target != (*cycles_itr).at(i-1))
        edge = edge->nextOut;
      if(edge->cycles.size() == 0)
      {
        assert(is_node_splitted.at((*cycles_itr).at(i)) != -1 && is_node_splitted.at((*cycles_itr).at(i)) < 2*(END_BASE + vShortcut.size()));
        assert(is_node_splitted.at((*cycles_itr).at(i-1)) != -1 && is_node_splitted.at((*cycles_itr).at(i-1)) < 2*(END_BASE + vShortcut.size()));
        graph->addNewEdge(is_node_splitted.at((*cycles_itr).at(i)), is_node_splitted.at((*cycles_itr).at(i-1)), 1);
      }
      edge->cycles.push_back(*cycles_itr);
      edge->cycleCount++;
    }
    edge = vertices[(*cycles_itr).at(0)].outHead;
    while(edge->target != (*cycles_itr).at((*cycles_itr).size()-1))
      edge = edge->nextOut;
    if(edge->cycles.size() == 0)
    {
      assert(is_node_splitted.at((*cycles_itr).at(0)) != -1 && is_node_splitted.at((*cycles_itr).at(0)) < 2*(END_BASE + vShortcut.size()));
      assert(is_node_splitted.at((*cycles_itr).at((*cycles_itr).size()-1)) != -1 && is_node_splitted.at((*cycles_itr).at((*cycles_itr).size()-1)) < 2*(END_BASE + vShortcut.size()));
      graph->addNewEdge(is_node_splitted.at((*cycles_itr).at(0)), is_node_splitted.at((*cycles_itr).at((*cycles_itr).size()-1)), 1);
    }
    edge->cycles.push_back(*cycles_itr);
    edge->cycleCount++;
  }

  //cout<<"Now begin to find the splitted points"<<endl;
  vector<nodepair> split_point;
  while(1)
  {
    int max_cycles = 0;
    nodepair max_pair;
    for(cycles_itr = cycles.begin(); cycles_itr != cycles.end(); ++cycles_itr)
    {   
      for(i = (*cycles_itr).size()-1; i>0; i--)
      { 
        edge = vertices[(*cycles_itr).at(i)].outHead;
        while(edge->target != (*cycles_itr).at(i-1))
          edge = edge->nextOut;
        if(edge->cycleCount > max_cycles)
        {
          max_cycles = edge->cycleCount;
          max_pair.src = edge->source;
          max_pair.target = edge->target;
        }
      }   
      edge = vertices[(*cycles_itr).at(0)].outHead;
      while(edge->target != (*cycles_itr).at((*cycles_itr).size()-1))
        edge = edge->nextOut;
      if(edge->cycleCount > max_cycles)
      {
        max_cycles = edge->cycleCount;
        max_pair.src = edge->source;
        max_pair.target = edge->target;
      }  
    }

    if(max_cycles == 0)
      break;
    else
    {
      edge = vertices[max_pair.src].outHead;
      while(edge->target != max_pair.target)
        edge = edge->nextOut;
      for(cycles_itr = edge->cycles.begin(); cycles_itr != edge->cycles.end(); ++cycles_itr)
      {   
        for(i = (*cycles_itr).size()-1; i>0; i--)
        { 
          edge2 = vertices[(*cycles_itr).at(i)].outHead;
          cout<<"("<<edge2->source;
          while(edge2->target != (*cycles_itr).at(i-1))
            edge2 = edge2->nextOut;
          edge2->cycleCount = 0;
          cout<<"-"<<edge2->target<<") ";
        }    
        edge2 = vertices[(*cycles_itr).at(0)].outHead;
        cout<<"("<<edge2->source;
        while(edge2->target != (*cycles_itr).at((*cycles_itr).size()-1))
          edge2 = edge2->nextOut;
        cout<<"-"<<edge2->target<<") "<<endl;
        edge2->cycleCount = 0;
      }
      split_point.push_back(max_pair);
      cout<<"Splitted point: "<<max_pair.src<<" "<<max_pair.target<<endl;
    }
  }

  vector<nodepair>::iterator split_itr;
  for(split_itr = split_point.begin(); split_itr != split_point.end(); ++split_itr)
  {
    graph->removeEdge((*split_itr).src, (*split_itr).target);
    graph->removeEdge(is_node_splitted.at((*split_itr).src), is_node_splitted.at((*split_itr).target));
    assert(is_node_splitted.at((*split_itr).src) != -1 && is_node_splitted.at((*split_itr).src) < 2*(END_BASE + vShortcut.size()));
    graph->addNewEdge(is_node_splitted.at((*split_itr).src), (*split_itr).target, 1);
  }

  cout<<"At the end "<<nEdges<<" edges is removed"<<endl;

  cout<<"The removed edges are: "<<endl;

  vector<vector<int> > grid;

  for(i=0; i<(MESHDIM-1)*(MESHDIM-1); i++)
  {
    vector<int> grid_element;
    grid.push_back(grid_element);
  }
  
  for(itr = EdgeRemoved.begin(); itr != EdgeRemoved.end(); ++itr)
  {
    int node = (*itr).src;
    int src_node;
    edge_direction dir;
    if(node<EAST_BASE)
    {
      ////cout<<node<<" ";
      src_node = node;
      dir = local;
    }
    else if(node<WEST_BASE)
    {
      ////cout<<"From west "<<((node-EAST_BASE)/(MESHDIM-1))*MESHDIM + (node-EAST_BASE)%(MESHDIM-1) + 1<<" ";
      src_node = ((node-EAST_BASE)/(MESHDIM-1))*MESHDIM + (node-EAST_BASE)%(MESHDIM-1) + 1;
      dir = west;
    }
    else if(node<SOUTH_BASE)
    {
      ////cout<<"From east "<<((node-WEST_BASE)/(MESHDIM-1))*MESHDIM + (node-WEST_BASE)%(MESHDIM-1)<<" ";
      src_node = ((node-WEST_BASE)/(MESHDIM-1))*MESHDIM + (node-WEST_BASE)%(MESHDIM-1);
      dir = east;
    }
    else if(node<NORTH_BASE)
    {
      ////cout<<"From north "<<(node-SOUTH_BASE) + MESHDIM<<" ";
      src_node = (node-SOUTH_BASE) + MESHDIM;
      dir = north;
    }
    else if(node<END_BASE)
    {
      ////cout<<"From south "<<(node-NORTH_BASE)<<" ";
      src_node = (node-NORTH_BASE);
      dir = south;
    }
    else
    {
      // //cout<<"From RF "<<(node - END_BASE)<<" ";
      src_node = vShortcut.at(node-END_BASE).dest_h * MESHDIM + vShortcut.at(node-END_BASE).dest_v;
      dir = rfi;
    }

    node = (*itr).target;
    int dest_node;
    bool flag = false;
    if(node<EAST_BASE)
    {
      ////cout<<node<<" ";
      dest_node = node;
    }
    else if(node<WEST_BASE)
    {
      ////cout<<((node-EAST_BASE)/(MESHDIM-1))*MESHDIM + (node-EAST_BASE)%(MESHDIM-1) + 1<<" ";
      dest_node = ((node-EAST_BASE)/(MESHDIM-1))*MESHDIM + (node-EAST_BASE)%(MESHDIM-1) + 1;
    }
    else if(node<SOUTH_BASE)
    {
      ////cout<<((node-WEST_BASE)/(MESHDIM-1))*MESHDIM + (node-WEST_BASE)%(MESHDIM-1)<<" ";
      dest_node = ((node-WEST_BASE)/(MESHDIM-1))*MESHDIM + (node-WEST_BASE)%(MESHDIM-1);
    }
    else if(node<NORTH_BASE)
    {
      ////cout<<(node-SOUTH_BASE) + MESHDIM<<" ";
      dest_node = (node-SOUTH_BASE) + MESHDIM;
    }
    else if(node<END_BASE)
    {
      ////cout<<(node-NORTH_BASE)<<" ";
      dest_node = (node-NORTH_BASE);
    }
    else
    {
      // //cout<<"From RF "<<(node - END_BASE)<<" ";
      dest_node = vShortcut.at(node-END_BASE).dest_h * MESHDIM + vShortcut.at(node-END_BASE).dest_v;
      flag = true;
    }

    ////cout<<endl;
    int grid_index = -1;
    turn t;
    
    if(flag == true)
    {
      cout<<"An edge which is a turn to RF-I is removed from ";
      switch(dir)
      {
        case east:
          cout<<"east ";
          break;
        case west:
          cout<<"west ";
          break;
        case south:
          cout<<"south ";
          break;
        case north:
          cout<<"north ";
          break;
        case rfi:
          cout<<"RF-I ";
        default:
          cout<<"Error occurred: "<<dir<<" "<<src_node<<" "<<dest_node<<endl;
          break;
      }
      cout<<src_node<<" to "<<dest_node<<endl;
    }
    else if(src_node/MESHDIM > dest_node/MESHDIM)
    {
      switch(dir)
      {
        case east:
          grid_index = (dest_node/MESHDIM)*(MESHDIM-1)+dest_node%MESHDIM;
          t = wton;
          break;
        case west:
          grid_index = (dest_node/MESHDIM)*(MESHDIM-1)+dest_node%MESHDIM - 1;
          t = eton;
          break;
        case south:
          cout<<"A non-turn edge is removed from south "<<dir<<" "<<src_node<<" "<<dest_node<<endl;
          break;
        case rfi:
          cout<<"An edge which is a turn from RF-I is removed from "<<src_node<<" to "<<dest_node<<endl;
          break;
        default:
          cout<<"Error occurred: "<<dir<<" "<<src_node<<" "<<dest_node<<endl;
          break;
      }
    }
    else if(src_node/MESHDIM < dest_node/MESHDIM)
    {
      switch(dir)
      {
        case east:
          grid_index = (src_node/MESHDIM)*(MESHDIM-1)+src_node%MESHDIM;
          t = wtos;
          break;
        case west:
          grid_index = (src_node/MESHDIM)*(MESHDIM-1)+src_node%MESHDIM - 1;
          t = etos;
          break;
        case north:
          cout<<"A non-turn edge is removed from north "<<dir<<" "<<src_node<<" "<<dest_node<<endl;
          break;
        case rfi:
          cout<<"An edge which is a turn from RF-I is removed from "<<src_node<<" to "<<dest_node<<endl;
          break;
        default:
          cout<<"Error occurred: "<<dir<<" "<<src_node<<" "<<dest_node<<endl;
          break;
      }
    }
    else if(src_node%MESHDIM > dest_node%MESHDIM)
    {
      switch(dir)
      {
        case south:
          grid_index = (dest_node/MESHDIM)*(MESHDIM-1)+dest_node%MESHDIM;
          t = ntow;
          break;
        case north:
          grid_index = (dest_node/MESHDIM-1)*(MESHDIM-1)+dest_node%MESHDIM;
          t = stow;
          break;
        case east:
          cout<<"A non-turn edge is removed from east "<<dir<<" "<<src_node<<" "<<dest_node<<endl;
          break;
        case rfi:
          cout<<"An edge which is a turn from RF-I is removed from "<<src_node<<" to "<<dest_node<<endl;
          break;
        default:
          cout<<"Error occurred: "<<dir<<" "<<src_node<<" "<<dest_node<<endl;
          break;
      }
    }
    else
    {
      if(src_node == dest_node)
        cout<<"Error Turn: "<<(*itr).src<<" "<<(*itr).target<<" ";
      switch(dir)
      {
        case south:
          grid_index = (src_node/MESHDIM)*(MESHDIM-1)+src_node%MESHDIM;
          t = ntoe;
          break;
        case north:
          grid_index = (src_node/MESHDIM-1)*(MESHDIM-1)+src_node%MESHDIM;
          t = stoe;
          break;
        case west:
          cout<<"A non-turn edge is removed from west "<<dir<<" "<<src_node<<" "<<dest_node<<endl;
          break;
        case rfi:
          cout<<"An edge which is a turn from RF-I is removed from "<<src_node<<" to "<<dest_node<<endl;
          break;
        default:
          cout<<"Error occurred: "<<dir<<" "<<src_node<<" "<<dest_node<<endl;
          break;
      }
    }

    if(grid_index >= 0)
      grid.at(grid_index).push_back(t);
  }

  for(i=0; i<(MESHDIM-1)*(MESHDIM-1); i++)
  {
    cout<<"Grid("<<i/(MESHDIM-1)<<" "<<i%(MESHDIM-1)<<"): ";
    vector<int>::iterator grid_itr;
    for(grid_itr = grid.at(i).begin(); grid_itr != grid.at(i).end(); ++grid_itr)
      cout<<(*grid_itr)<<" ";
    cout<<endl;
  }

  shortest_path(END_BASE + vShortcut.size() + splitted_channels.size());
  EdgeWeight_Update(END_BASE + vShortcut.size() + splitted_channels.size());
}

void Dijkstra::Construct_Routing_Table(char* profile)
{
  // Verify whether all the pairs can be minimal routed
  int i, j, p;
      
  cout<<"****************************************************"<<endl;
  cout<<"Verify whether all the pairs can be minimal routed *"<<endl;
  cout<<"****************************************************"<<endl;
  
  ifstream fin;
  fin.open(profile);

  int nPhase;
  int nNet;
  int src, dest;
  double netWeight;

  fin>>nPhase;
  
  for(p=0; p<nPhase; p++)
  {
    fin>>nNet;

    for(i = 0; i< nNet; i++)
    {
      fin>>src>>dest>>netWeight;
      if(d.at(src).at(dest+MESHDIM*MESHDIM) > (abs(src/MESHDIM - dest/MESHDIM) + abs(src%MESHDIM - dest%MESHDIM) + 1))
        cout<<src<<"-"<<dest<<": "<<d.at(src).at(dest+MESHDIM*MESHDIM)<<" "<<(abs(src/MESHDIM - dest/MESHDIM) + abs(src%MESHDIM - dest%MESHDIM) + 1)<<endl;
    }
  }

  // Constructing the Routing table
  const DGraphVertex *vertices = graph->vertices;
  const DGraphEdge *edge;
  const DGraphEdge *edge2;
  const DGraphEdge *edge3;
  int k;
  
  for(i=0; i<MESHDIM*MESHDIM; i++)
  {
    cout<<"Router "<<i<<": "<<endl;
    for(j=0; j<MESHDIM*MESHDIM; j++)
    {
      fout<<i<<" "<<j<<endl;
      if(j == i)
      {
        edge2 = vertices[i+MESHDIM*MESHDIM].inHead;
        fout<<"1 0"<<endl;
        while(edge2 && edge2->source < END_BASE + vShortcut.size())
        {
          fout<<"1 0"<<endl;
          edge2 = edge2->nextIn;
        }
        fout<<endl;
        continue;
      }
      
      cout<<"{"<<endl;

      cout<<i<<"-"<<j<<": "<<nSP.at(i).at(j+MESHDIM*MESHDIM)<<"    ";
      edge2 = vertices[i].outHead;
      vector<int> out_vertices;
      while(edge2)
      { 
        if(d.at(edge2->target).at(j+MESHDIM*MESHDIM) < d.at(i).at(j+MESHDIM*MESHDIM))
          cout<<edge2->target<<"-"<<j<<": "<<nSP.at(edge2->target).at(j+MESHDIM*MESHDIM)<<"    ";
        if(nSP.at(edge2->target).at(j+MESHDIM*MESHDIM) > 0 && d.at(edge2->target).at(j+MESHDIM*MESHDIM) < d.at(i).at(j+MESHDIM*MESHDIM) )
        { 
          vector<int>::iterator itr;
          int sflag = 0;
          if(edge2->target >= END_BASE + vShortcut.size())
          {
            // This is a splitted channel
            for(itr = out_vertices.begin(); itr != out_vertices.end(); ++itr)
            { 
              if(splitted_channels.at(edge2->target - END_BASE - vShortcut.size()) == (*itr))
              { 
                sflag = 1;
                break;
              }
            }            
          }

          if(sflag == 0)
          {
            int size = out_vertices.size();

            for(itr = out_vertices.begin(); itr != out_vertices.end(); ++itr)
            {
              if(nSP.at(edge2->target).at(j+MESHDIM*MESHDIM) > nSP.at(*itr).at(j+MESHDIM*MESHDIM))
              {
                out_vertices.insert(itr, edge2->target);
                break;
              }
            }
            if(out_vertices.size() == size)
              out_vertices.push_back(edge2->target);
          }
        }
        edge2 = edge2->nextOut;
      }

      cout<<" Candidate out node: ";
      if(out_vertices.size() == 0)
        fout<<"1 -5"<<endl;
      else
      {
        fout<<out_vertices.size()<<" ";
        for(k=0; k<out_vertices.size(); k++)
        {
          cout<<out_vertices.at(k)<<" ";
          fout<<direction(out_vertices.at(k))<<" ";
        }
        fout<<endl;
      }
      cout<<endl;

      edge = vertices[i+MESHDIM*MESHDIM].inHead;
      while(edge && edge->source < END_BASE + vShortcut.size())
      { 
        cout<<edge->source<<"-"<<j<<": "<<nSP.at(edge->source).at(j+MESHDIM*MESHDIM)<<"    ";
        edge3 = vertices[i+MESHDIM*MESHDIM].inHead;
        int flag = 0;
        while(edge3)
        {
          if(edge3->source >= END_BASE + vShortcut.size() && splitted_channels.at(edge3->source - END_BASE - vShortcut.size()) == edge->source)
          {
            // There is a splitted channels for this node
            flag = 1;
            break;
          }
          edge3 = edge3->nextIn;
        }

        if(flag == 0)
        {
          edge2 = vertices[edge->source].outHead;
          out_vertices.clear();
          while(edge2)
          {
            if(d.at(edge2->target).at(j+MESHDIM*MESHDIM) < d.at(edge->source).at(j+MESHDIM*MESHDIM))
              cout<<edge2->target<<"-"<<j<<": "<<nSP.at(edge2->target).at(j+MESHDIM*MESHDIM)<<"    ";
            if(nSP.at(edge2->target).at(j+MESHDIM*MESHDIM) > 0 && d.at(edge2->target).at(j+MESHDIM*MESHDIM) < d.at(edge->source).at(j+MESHDIM*MESHDIM) )
            {
              int size = out_vertices.size();
              vector<int>::iterator itr;

              int sflag = 0;
              if(edge2->target >= END_BASE + vShortcut.size())
              {
                // This is a splitted channel
                for(itr = out_vertices.begin(); itr != out_vertices.end(); ++itr)
                {
                  if(splitted_channels.at(edge2->target - END_BASE - vShortcut.size()) == (*itr))
                  {
                    sflag = 1;
                    break;
                  }
                }
              }

              if(sflag == 0)
              {
                for(itr = out_vertices.begin(); itr != out_vertices.end(); ++itr)
                {
                  if(nSP.at(edge2->target).at(j+MESHDIM*MESHDIM) > nSP.at(*itr).at(j+MESHDIM*MESHDIM))
                  {
                    out_vertices.insert(itr, edge2->target);
                    break;
                  }
                }
                if(out_vertices.size() == size)
                  out_vertices.push_back(edge2->target);
              }
            }
            edge2 = edge2->nextOut;
          }

          cout<<" Candidate out node: ";
          if(out_vertices.size() == 0)
            fout<<"1 -5"<<endl;
          else
          {
            fout<<out_vertices.size()<<" ";
            for(k=0; k<out_vertices.size(); k++)
            { 
              cout<<out_vertices.at(k)<<" ";
              fout<<direction(out_vertices.at(k))<<" ";
            }
            fout<<endl;
          }
          cout<<endl;
        }
        else
        {
          // There is splitted channel for this node, which is denoted by edge3->source
          edge2 = vertices[edge3->source].outHead;
          out_vertices.clear();
          while(edge2)
          {
            if(d.at(edge2->target).at(j+MESHDIM*MESHDIM) < d.at(edge3->source).at(j+MESHDIM*MESHDIM))
              cout<<edge2->target<<"-"<<j<<": "<<nSP.at(edge2->target).at(j+MESHDIM*MESHDIM)<<"    ";
            if(nSP.at(edge2->target).at(j+MESHDIM*MESHDIM) > 0 && d.at(edge2->target).at(j+MESHDIM*MESHDIM) < d.at(edge3->source).at(j+MESHDIM*MESHDIM) )
            {
              int size = out_vertices.size();
              vector<int>::iterator itr;

              for(itr = out_vertices.begin(); itr != out_vertices.end(); ++itr)
              {
                int temp;
                if((*itr) >= 2*(END_BASE + vShortcut.size()))
                  temp = (*itr) - END_BASE - vShortcut.size();
                else
                  temp = (*itr);
                if(nSP.at(edge2->target).at(j+MESHDIM*MESHDIM) > nSP.at(temp).at(j+MESHDIM*MESHDIM))
                {
                  if(edge2->target >= END_BASE + vShortcut.size())
                    out_vertices.insert(itr, END_BASE + vShortcut.size() + edge2->target);
                  else
                    out_vertices.insert(itr, edge2->target);
                  break;
                }
              }
              if(out_vertices.size() == size)
              {
                if(edge2->target >= END_BASE + vShortcut.size())
                  out_vertices.push_back(edge2->target + END_BASE + vShortcut.size());
                else
                  out_vertices.push_back(edge2->target);
              }
            }
            edge2 = edge2->nextOut;
          }

          cout<<" Candidate out node: ";
          if(out_vertices.size() == 0)
            fout<<"1 -5"<<endl;
          else
          {
            fout<<out_vertices.size()<<" ";
            for(k=0; k<out_vertices.size(); k++)
            {
              cout<<out_vertices.at(k)<<" ";
              fout<<direction(out_vertices.at(k))<<" ";
            }
            fout<<endl;
          }
          cout<<endl;
        }
        edge = edge->nextIn;
      }
      fout<<endl;
      cout<<"}"<<endl;
    }
    cout<<endl;
  }

  fin.close();
}

void Dijkstra::EdgeWeight_Update(int n)
{
  // Find using probility for edges in shortest paths for each pair of vertices
  
  //const int n = END_BASE + vShortcut.size();
  const DGraphVertex *vertices = graph->vertices;

  int src, dest;
  double netWeight;

  int i, j, p;
  int imNode;
  double prob;
  DGraphEdge *edge;

  vector<vector<net> >::iterator piter;
  for(piter = profiling.begin(); piter != profiling.end(); ++piter)
  {
    vector<net>::iterator niter;
    for(niter = (*piter).begin(); niter != (*piter).end(); ++niter)
    {
      src = (*niter).src;
      netWeight = (*niter).weight;
      //fin>>src>>dest>>netWeight;

      //cout<<"Net "<<src<<" "<<dest<<": *****************************************************"<<endl;
      dest = (*niter).dest + MESHDIM*MESHDIM;

      list<int> nodeQueue;

      for(j= 0; j < n; j++) s[j] = false;

      nodeQueue.push_back(dest);
      s[dest] = true;

      while(nodeQueue.size()>0)
      {
        imNode = nodeQueue.front();
        nodeQueue.pop_front();
        if(pNode.at(src).at(imNode).size() > 0)
        {
          for(j=0; j<pNode.at(src).at(imNode).size(); j++)
          {
            int adjNode = pNode.at(src).at(imNode).at(j);
            if(s[adjNode] == false)
            {
              nodeQueue.push_back(adjNode);
              s[adjNode] = true;
            }

            prob = ((double)(nSP.at(src).at(adjNode) * nSP.at(imNode).at(dest)))/ ((double) nSP.at(src).at(dest));
            edge = vertices[adjNode].outHead;
            while(edge->target != imNode)
              edge = edge->nextOut;
            edge->phaseWeight += netWeight*prob;

            if(edge->locked == false && (nSP.at(src).at(adjNode) * nSP.at(imNode).at(dest) == nSP.at(src).at(dest)) && adjNode > SINK_BASE && imNode > EAST_BASE)
            {
              if((*niter).critical == true)
              {
                edge->locked = true;
              }
              else
              {
                double v_phaseWeight = edge->phaseWeight;
                double v_weight = edge->weight;
                double v_weightToBeReduced = edge->weightToBeReduced;

                //cout<<"To test reachability: ";
                graph->removeEdge(adjNode, imNode);
                if(!graph->reachable(src, dest))
                {
                  graph->addNewEdge(adjNode, imNode, 1);
                  edge = vertices[adjNode].outHead;
                  while(edge->target != imNode)
                    edge = edge->nextOut;
                  edge->phaseWeight = v_phaseWeight;
                  edge->weight = v_weight;
                  edge->weightToBeReduced = v_weightToBeReduced;
                  edge->locked = true;
                  //cout<<"Edge "<<adjNode<<" "<<imNode<<" is locked"<<endl;
                }
                else
                {
                  graph->addNewEdge(adjNode, imNode, 1);
                  edge = vertices[adjNode].outHead;
                  while(edge->target != imNode)
                    edge = edge->nextOut;
                  edge->phaseWeight = v_phaseWeight;
                  edge->weight = v_weight;
                  edge->weightToBeReduced = v_weightToBeReduced;
                }
              }
            }
          }
        }
      }
    }

    // Update the max weight and clear the phase weight
    for(i=0; i<n; i++)
    {
      edge = vertices[i].outHead;
      while(edge != NULL)
      {
        if(edge->weight < edge->phaseWeight)
          edge->weight = edge->phaseWeight;
        //cout<<edge->source<<" "<<edge->target<<" "<<edge->weight<<endl;
        edge->phaseWeight = 0;
        edge = edge->nextOut;
      }
    }
  }

}

double Dijkstra::Mesh_adaptiveness(char* profile)
{
  const int n = graph->nVertices;
  const DGraphVertex *vertices = graph->vertices;

  ifstream fin;
  fin.open(profile);

  int nPhase;
  int nNet;
  int src, dest;
  double netWeight;

  int i, j, p;
  int imNode;
  double prob;
  DGraphEdge *edge;

  fin>>nPhase;

  double WeightSum = 0;
  double adaptiveness_sum = 0;
  
  for(p=0; p<nPhase; p++)
  {
    fin>>nNet;

    for(i = 0; i< nNet; i++)
    {
      fin>>src>>dest>>netWeight;

      unsigned long long max_adaptiveness = factorial(abs(src/MESHDIM - dest/MESHDIM) + abs(src%MESHDIM - dest%MESHDIM)) / (factorial(abs(src/MESHDIM - dest/MESHDIM)) * factorial(abs(src%MESHDIM - dest%MESHDIM)));

      dest = dest + MESHDIM*MESHDIM;

      double adaptiveness = (double)nSP.at(src).at(dest) / (double)max_adaptiveness;

      //cout<<src<<" - "<<" "<<dest-MESHDIM*MESHDIM<<": "<<nSP.at(src).at(dest)<<" "<<max_adaptiveness<<" "<<adaptiveness<<endl;
      adaptiveness_sum += netWeight*adaptiveness;
      WeightSum += netWeight;
    }
  }

  fin.close();

  return adaptiveness_sum/WeightSum;
}

unsigned long long Dijkstra::factorial(unsigned long long n)
{
  if(n<2)      
    return 1;   
  return n * factorial(n - 1);   
}

