#ifndef GRAPH_H
#define GRAPH_H

#include "headers.h"
#include "Node.h"
#include "Edge.h"
#include "llvm_headers.h"

class Edge;
class Node;
class Graph;
class Processor;
class SCC;


typedef std::list<Edge*> EdgeList;
typedef std::vector<Edge*> EdgeVector;
typedef std::list<Node*> NodeList;

typedef std::vector<Edge*>::iterator EdgeIterator;
typedef std::vector<Edge*>::iterator EdgeVectorIterator;
typedef std::vector<Node*>::iterator NodeIterator;



namespace llvm
{
    class LoopDataStructure;
}
class Graph
{
    public:
        Graph();
        ~Graph();
        void clear();
        void addNode(Node* n);
        void addEdge(Edge* e);

        void eraseNode(Node* X);
        void disconnectNode(Node* X);
        void eraseEdge(Edge* e);

        std::vector<Node*> getPredecessors(Node* n);
        std::vector<Node*> getSuccessors(Node* n);
        void topoSort(bool reassignIds = false);
        bool allPredsGone(Node* n, std::map<Node*, bool> search);
        void dumpDot(string filename = "graph.dot");

        unsigned getNumNodes() { return mNodeList.size(); }
        unsigned getNumEdges() { return mEdgeList.size(); }

        vector<Node*> getNodes() { return mNodeList; }
        vector<Edge*> getEdges() { return mEdgeList; }

        void setName(string name) { mName = name; }
        string getName() { return mName; }

        Node* getNodeFromId(unsigned id);
        Edge* getEdgeFromId(unsigned id);

        Edge* getEdge(Node* V1, Node* V2);
        bool doesEdgeExist(Node* V1, Node* V2);

        unsigned getId() { return mId; }
        void setId(unsigned id) { mId = id; }

        NodeIterator beginNode() { return mNodeList.begin(); }
        NodeIterator endNode() { return mNodeList.end(); }

        Node* createNode(string name = "", unsigned nodeType = NORMAL_NODE_TYPE);
        Edge* createEdge(Node* n1, Node* n2);
        void setEdgeWeight(Node* pred, Node* succ, double value);
        void setAllNodeNumDynamicInstances(double val);
        void setAllEdgeWeights(double val);

        //LLVM specific
        Node* createNode(llvm::Value* lVal, unsigned nodeType = NORMAL_NODE_TYPE);
        Edge* createEdge(llvm::Value* pred, llvm::Value* succ);
        Node* getNode(llvm::Value* X);
        bool existsEdge(llvm::Value* V1, llvm::Value* V2);
        Edge* getEdge(llvm::Value* V1, llvm::Value* V2);
        bool doesEdgeExist(llvm::Value* V1, llvm::Value* V2);
        Node* getNode(unsigned idx) { return mNodeList[idx]; }
        Node* getNodeIfExists(llvm::Value* X);
        void setEdgeWeight(llvm::Value* pred, llvm::Value* succ, double value);
        void markBackEdge(llvm::Value* pred, llvm::Value* succ, double value);
        void setFunction(llvm::Function* X) { mFunction = X; }
        llvm::Function* getFunction() { return mFunction; }
        bool isBackEdge(Node* X, Node* Y);


        //Externally visible nodes
        vector<Node*> getExternallyVisibleNodes() { return mExternallyVisibleNodes; }
        void addExternallyVisibleNode(Node* X);
        unsigned getExternallyVisibleNodeVectorSize() { return mExternallyVisibleNodes.size(); }
        Node* getExternallyVisibleNode(unsigned idx) { return mExternallyVisibleNodes[idx]; }

        //Separated from rest of the graph - for caller functions only 
        vector<Node*> getCalleeExternallyVisibleNodes() { return mCalleeExternallyVisibleNodes; }
        //no duplicate check, because guaranteed to have unique copy
        void addCalleeExternallyVisibleNode(Node* X) { mCalleeExternallyVisibleNodes.push_back(X); }	
        Node* getCalleeExternallyVisibleNode(unsigned idx) { return mCalleeExternallyVisibleNodes[idx]; }
        void createExternallyVisibleSubGraph();
        Graph* getExternallyVisibleSubGraph() { return mExternallyVisibleSubgraph; }

        //DFS
        bool DFS(bool exitOnLoop, bool reverse, bool storeSCCs);
        void initDFS();
        bool DFSVisit(Node* currNode, unsigned& level, unsigned searchIdx, bool exitOnLoop, bool reverse, bool storeSCCs);
        bool testForCycles() { return DFS(true, false, false); }

        //SCC
        void createSCCGraph();
        void sccBasedToposort(bool reAssignIds);
        void identifySCCs();
        SCC* getFirstNonTrivialSCC();

        void update_propagate_cycle(vector<Node*> currCycle, double weight);

        //Johnson's technique for enumerating elementary cycles
        void Johnson_Elementary_Cycles();
        void initCircuit();
        bool Circuit(Node* rootNode, Node* s, vector<Node*> currPath, double weight, bool& cutOffLimit);
        unsigned getNumCycles() { return mNumCycles; }

        //dominator tree
        void buildDominatorTree();
        void buildNearestDominatorMatrix(vector<vector<Node*> >& matrix);

        //propagate
        void initPropagate();
        void propagate(vector<Node*> externVisibleNodes, bool skipJohnson = false);
        bool hasBeenPropagated() { return mHasBeenPropagated; }
        void markAllCriticalNodes();

        void markDFGCritical();
        unsigned markAll1Affecters(unsigned& newCriticalBlocks);
        void addCriticalNode(Node* X) { mCriticalNodes.push_back(X); }
        vector<Node*>& getCriticalNodes() { return mCriticalNodes; }

        void setCFG(Graph* X) { mTheOtherHalf = X ; }
        void setDFG(Graph* X) { mTheOtherHalf = X ; }
        Graph* getDFG() { return mTheOtherHalf; }
        Graph* getCFG() { return mTheOtherHalf; }

        //CFG critical blocks marks
        void markCriticalBlocks(llvm::LoopDataStructure* loopInfo);
        unsigned addCriticalLoopExitBlocks(set<llvm::Loop*>& criticalLoops, llvm::BasicBlock* blk, llvm::LoopDataStructure* loopInfo);
        void findSuccBlocksBeforeImmPostDom(llvm::Function& F, llvm::PostDominatorTree* postDomTree);
        bool reachesCriticalBeforePostDom(Node* X);

        void enumerateAllPaths();
        void getAllPaths(vector<vector<Node*> >& nodePathsVector, Node* rootNode);
        bool shouldBuildEdge(llvm::Value* X);

        //		void buildBoostGraph();
    private:
        unsigned mId;
        std::string mTGFFFileName;
        std::string mMetroFileName;

        string mName;

        std::vector<Node*> mNodeList;
        std::vector<Edge*> mEdgeList;

        std::map<unsigned, Node*> mId2Node;
        std::map<unsigned, Edge*> mId2Edge;

        map<llvm::Value*, Node*> mLLVM2Node;	
        map<pair<llvm::Value*, llvm::Value*>, Edge*> mLLVM2Edge;
        llvm::Function* mFunction;

        //SCC data
        vector<SCC*> mSCCVector;
        Graph* mSCCGraph;
        unsigned mNumCycles;

        //LLVM specific
        vector<Node*> mExternallyVisibleNodes;
        set<Node*> mExternallyVisibleNodeSet;
        vector<Node*> mCalleeExternallyVisibleNodes;
        Graph* mExternallyVisibleSubgraph;

        bool mHasBeenPropagated;
        vector<Node*> mCriticalNodes;

        //if this is CFG, then this is DFG else CFG
        Graph* mTheOtherHalf;

        //for boost algorithms
        //		BoostGraph mBoostGraph;
};

#endif
