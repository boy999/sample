/* Directed Graphs
 * ----------------------------------------------------------------------------
 * Author:  Shane Saunders
 */
#include <cstdio>
#include <iostream>
#include "dgraph.h"

using namespace std;

/*--- DGraph ----------------------------------------------------------------*/

/* --- Constructor ---
 * Creates a DGraph object containing n vertices.
 */
DGraph::DGraph(int n)
{
    nVertices = n;
    nEdges = 0;
    vertices = new DGraphVertex[n];
    initVertices();
}

/* --- Destructor ---
 */
DGraph::~DGraph()
{
    clear();
    delete [] vertices;
}

/* --- clear() ---
 * Clears all edges from the graph.
 */
void DGraph::clear()
{
    DGraphEdge *edge, *nextEdge;
    for(int i = 0; i < nVertices; i++) {
        edge = vertices[i].outHead;

        while(edge) {
            nextEdge = edge->nextOut;
            delete edge;
            edge = nextEdge;
        }
    }
    initVertices();
}

void DGraph::initVertices()
{
    for(int i = 0; i < nVertices; i++) {
        vertices[i].outHead = vertices[i].outTail = 0;
        vertices[i].inHead = vertices[i].inTail = 0;
        vertices[i].outSize = vertices[i].inSize = 0;
    }
}
    
/* --- addNewEdge() ---
 * Adds a new edge from vertex 'source' to vertex 'target' with
 * with a corresponding distance of dist.
 */
void DGraph::addNewEdge(int source, int target, int dist)
{
    DGraphEdge *newEdge = new DGraphEdge;
    newEdge->source = source;
    newEdge->target = target;
    newEdge->dist = dist;
    newEdge->nextOut = NULL;
    newEdge->nextIn = NULL;
    newEdge->weight = 0;
    newEdge->phaseWeight = 0;
    newEdge->weightToBeReduced = 0;
    newEdge->locked = false;
    newEdge->cycleCount = 0;
    
    DGraphVertex *vertex = &vertices[source];
    if(vertex->outTail) {
        vertex->outTail->nextOut = newEdge;
    }
    else {
        vertex->outHead = newEdge;
    }
    vertex->outTail = newEdge;
    vertex->outSize++;

    vertex = &vertices[target];
    if(vertex->inTail) {
        vertex->inTail->nextIn = newEdge;
    }
    else {
        vertex->inHead = newEdge;
    }
    vertex->inTail = newEdge;
    vertex->inSize++;
    nEdges++;
    //cout<<source<<" "<<target<<endl;
}

bool DGraph::removeEdge(int source, int target)
{
  DGraphVertex *vertex = &vertices[source];
  DGraphEdge *edge = vertex->outHead;
  DGraphEdge *pEdge;

  while(edge && edge->target != target) 
  {
    pEdge = edge;
    edge = edge->nextOut; 
  }

  if(edge == NULL)
  {
    cout<<"Edge "<<source<<" to "<<target<<" does not exist";
    return false;
  }
  else
  {
    if(vertex->outHead == vertex->outTail)
    {
      vertex->outTail = NULL;
      vertex->outHead = NULL;
    }
    else if(edge == vertex->outHead) 
    {
      vertex->outHead = vertex->outHead->nextOut;
    }
    else if(edge == vertex->outTail)
    {
      vertex->outTail = pEdge;
      pEdge->nextOut = edge->nextOut;
    }
    else
    {
      pEdge->nextOut = edge->nextOut;
    }
  }

  vertex = &vertices[target];
  edge = vertex->inHead;

  while(edge && edge->source != source)
  {
    pEdge = edge;
    edge = edge->nextIn;
  }

  if(edge == NULL)
  {
    cout<<"Edge "<<source<<" to "<<target<<" does not exist";
    return false;
  }
  else
  {
    if(vertex->inHead == vertex->inTail)
    {
      vertex->inTail = NULL;
      vertex->inHead = NULL;
    }
    else if(edge == vertex->inHead)
    { 
      vertex->inHead = vertex->inHead->nextIn;
    }
    else if(edge == vertex->inTail)
    {
      vertex->inTail = pEdge;
      pEdge->nextIn = NULL;
    }
    else
    { 
      pEdge->nextIn = edge->nextIn;
    }

    free(edge);
    nEdges--;
    //cout<<"Edge "<<source<<" "<<target<<" is removed"<<endl;
  }
  return true;
}

bool DGraph::edgeExists(int v, int w) const
{
    /* Scan all existing edges from v to determine whether an edge to w exists.
     */
    const DGraphEdge *edge = vertices[v].outHead;
    while(edge) {
        if(edge->target == w) return true;
        edge = edge->nextOut;
    }
    return false;
}

/* --- reachable() ---
 * Test whether all vertices are reachable from the source vertex s.
 */
bool DGraph::reachable(int s) const
{
    int *stack = new int[nVertices];
    int tos = 0;
    
    int *visited = new int[nVertices];
    for(int i = 0; i < nVertices; i++) visited[i] = 0;

    int vertexCount = 0;
    visited[s] = 1;
    stack[tos++] = s;
    DGraphEdge *edge;
    int v, w;
    while(tos) {
        v = stack[--tos];
        cout<<v<<" ";
        vertexCount++;
        edge = vertices[v].outHead;
        while(edge) {
            w = edge->target;
            if(!visited[w]) {
                visited[w] = 1;
                stack[tos++] = w;
            }
            edge = edge->nextOut;
        }
    }

    delete [] stack;
    delete [] visited;

    cout<<endl<<vertexCount<<" nodes reachable from "<<s<<endl;
    return vertexCount == nVertices;
}

bool DGraph::reachable(int s, int d) const
{
  int *stack = new int[nVertices];
  int tos = 0;

  int *visited = new int[nVertices];
  for(int i = 0; i < nVertices; i++) visited[i] = 0;

  int vertexCount = 0;
  visited[s] = 1;
  stack[tos++] = s;
  DGraphEdge *edge;
  int v, w;
  while(tos) {
    v = stack[--tos];
    //cout<<v<<" ";
    vertexCount++;
    edge = vertices[v].outHead;
    while(edge) {
      w = edge->target;
      if(!visited[w]) {
        visited[w] = 1;
        stack[tos++] = w;
      }
      edge = edge->nextOut;
    }
  }

  if(visited[d] == 1)
  {
    delete [] stack;
    delete [] visited;
    return true;
  }
  else
  {
    delete [] stack;
    delete [] visited;
    return false;
  }
}


/* --- print() ---
 * Prints a text representation of the graph to the standard output.
 */
void DGraph::print() const
{
    const DGraphEdge *edge;

    cout<<"Vertices: "<<nVertices<<endl;
    cout<<"Edges: "<<nEdges<<endl;
    printf("Graph (vertex: edge list) = \n");

    for(int i = 0; i < nVertices; i++) {
        printf("%d: ", i);
        edge = vertices[i].outHead;
        while(edge) {
            printf(" %d", edge->target);
            edge = edge->nextOut;
        }
        putchar('\n');
    }

    printf("Graph (vertex: edge{dist} list) = \n");

    for(int i = 0; i < nVertices; i++) {
        printf("%d: ", i);
        edge = vertices[i].outHead;
        while(edge) {
            printf(" %d{%d}", edge->target, edge->dist);
            edge = edge->nextOut;
        }
        putchar('\n');
    }
}

