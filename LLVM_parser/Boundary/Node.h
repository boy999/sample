#ifndef NODE_H
#define NODE_H

#include "headers.h"
#include "llvm_headers.h"

enum NodeClassTypeEnum
{
	NORMAL_NODE_TYPE=0,
	ASIP_NODE_TYPE,
    ARG_NODE_TYPE  // add this type for arg node
};


enum NodeOrderType
{
	PREDECESSORS,
	SUCCESSORS
};

typedef unsigned ProcTypeDef;
class Graph;
class SCC;
class Function;
class Edge;

class Node
{
	protected:
		std::vector<Edge*> mInEdges;
		std::vector<Edge*> mOutEdges;
        std::map<Node*, Edge*> mInMap;
        std::map<Node*, Edge*> mOutMap;
		vector<Node*> mPredecessorNodes;
		vector<Node*> mSuccessorNodes;
		std::string mName;
		unsigned mNodeId;
				
		//Generic features
		unsigned mType;
		unsigned mNumPredecessors;
		unsigned mNumSuccessors;
		
		Graph* mGraph;

		//unused - variable
		unsigned mTrackerId;

		//DFS parameters
		bool mDFSVisited;
		unsigned mDFSLevel;
		unsigned mDFSSearchIdx;
		Node* mDFSPredecessor;
		bool mInDFSPath;

		//profiling data
		unsigned mNumDynamicInstances;
		vector<unsigned> mTargetLoadIds;
		vector<double> mTargetLoadIdWeights;
		vector<unsigned> mSrcStoreIds;
		vector<double> mSrcStoreIdWeights;

		//propagate data
		double mSelfWeight;
		vector<double> mPropagatedValues;	//there is one value for each node which is directly visible externally

		//SCC and Johnson's cycles
		SCC* mSCC;
		set<Node*> mJohnsonBSet;

		//dominator
		set<Node*> mDominatorsSet;

		//LLVM related
		unsigned mLLVMNodeId;
		llvm::Value* mLLVMValue;	
		int mCallSiteId;
		llvm::Function* mFunction;
		vector<llvm::Function*> mCalledFunctionVector;
		Node* mCalleeNode;
		vector<Graph*> mCalleeGraphVector;
		unsigned mArgId;
		llvm::Function* mCalledFunction;

		//Duplicates while running propagate
		set<Node*> mDuplicatesSet;
		vector<Node*> mDuplicatesVec;
		map<unsigned, Node*> mDuplicatesMap;
		Node* mOriginalNode;

        Node* mASIPClonedNode;
        Node* mASIPOriginalNode;

		void* mArbitraryData;
	public:
		Node(Graph* g, std::string name, unsigned id);
		~Node() { clear(); }
		std::string getName();
		unsigned getId() { return mNodeId; }

		void setId(unsigned id) { mNodeId = id; }
		void setName(string name) { mName = name; }
		string getNodeName() { return mName; }

		Graph* getParentGraph() { return mGraph; }
		
		//initialization
		void clear();

		void addInEdge(Edge* e);
		void addOutEdge(Edge* e);
		Edge* deleteEdge(Node*node, NodeOrderType t);
		void eraseInEdge(Edge* e);
		void eraseOutEdge(Edge* e);
		void eraseEdges();

		unsigned getNumPredecessors() { return mNumPredecessors; }
		unsigned getNumSuccessors() { return mNumSuccessors; }

		vector<Node*> getSuccessors();
		vector<Node*> getPredecessors();
		Edge* getPredecessorEdge(unsigned i)
		{
			assert(i<mInEdges.size());
			return mInEdges[i];
		}
        
        Edge* getSuccessorEdge(Node* Y)
        {
            if(NOTFOUND(mOutMap, Y))
                cerr << "Successor node "<<Y->getName()<<" not found for node "<<getName()<<endl;
            assert(!NOTFOUND(mOutMap, Y));
            return mOutMap[Y];
        }

        
		Edge* getSuccessorEdge(unsigned i)
		{
			assert(i<mOutEdges.size());
			return mOutEdges[i];
		}
      
        Edge* getSuccessorEdgeIfExist(Node* Y)
        {
            if(!NOTFOUND(mOutMap, Y))
                return mOutMap[Y];
            else
                return (Edge*)0;
        }

        unsigned getType() { return mType; }
        void setType(unsigned iType) { mType = iType; }
        bool isPO() { return (mNumSuccessors == 0); }	
        bool isPI() { return (mNumPredecessors == 0); }

		//unused
		void setTrackerId(unsigned val) { mTrackerId = val; }
		unsigned getTrackerId() { return mTrackerId; }

		//DFS parameters
		void markDFSVisited(bool flag) { mDFSVisited = flag; }
		bool isDFSVisited() { return mDFSVisited; }
		void setDFSLevel(unsigned level) { mDFSLevel = level; }
		unsigned getDFSLevel() { return mDFSLevel; }
		void setDFSSearchIdx(unsigned id) { mDFSSearchIdx = id; }
		unsigned getDFSSearchIdx() { return mDFSSearchIdx; }
		void setDFSPredecessor(Node* Z) { mDFSPredecessor = Z; }
		Node* getDFSPredecessor() { return mDFSPredecessor; }
		static bool DFSCompare(Node* X, Node* Y) { return X->getDFSLevel() > Y->getDFSLevel(); }
		void markInDFSPath(bool val) { mInDFSPath = val; }
		bool isInDFSPath() { return mInDFSPath; }

		//SCC
		void setSCC(SCC* X) { mSCC = X; }
		SCC* getSCC() { return mSCC; }

		//Profiling data
		void setNumDynamicInstances(unsigned X) { mNumDynamicInstances = X; }
		unsigned getNumDynamicInstances() { return mNumDynamicInstances; }
		double getSelfWeight() { return mSelfWeight; }
		void updateSelfWeight(double X);
		vector<unsigned> getTargetLoadIds() { return mTargetLoadIds; }
		vector<unsigned> getSrcStoreIds() { return mSrcStoreIds; }
		double getTargetLoadIdWeight(unsigned idx)
		{
			assert(idx < mTargetLoadIdWeights.size());
			return mTargetLoadIdWeights[idx];
		}
		void addTargetLoad(unsigned loadId, double weight);
		void addSrcStore(unsigned storeId, double weight);

		//LLVM related
		int getCallSiteId() { return mCallSiteId; }
		void setCallSiteId(int val) { mCallSiteId = val; }
		void setLLVMId(unsigned id) { mLLVMNodeId = id; }
		unsigned  getLLVMNodeId() { return mLLVMNodeId; }
		void setLLVMValue(llvm::Value* n) { mLLVMValue = n; }
		llvm::Value* getLLVMValue() { return mLLVMValue; }
		void copyLLVMData(Node* X);
		void setFunction(llvm::Function* F) { mFunction = F; }
		llvm::Function* getFunction() { return mFunction; }
		void setCalleeNode(Node* X) { mCalleeNode = X; }
		Node* getCalleeNode() { return mCalleeNode; }
		void addCalledFunction(llvm::Function* f) { mCalledFunctionVector.push_back(f); }
		vector<llvm::Function*> getCalledFunctions() { return mCalledFunctionVector; }
		void addCalleeGraph(Graph* g) { mCalleeGraphVector.push_back(g); }
		vector<Graph*> getCalleeGraphVector() { return mCalleeGraphVector; }
		void setCalledFunction(llvm::Function* f) { mCalledFunction = f; }
		llvm::Function* getCalledFunction() { return mCalledFunction; }
		void setArgId(unsigned val) { mArgId = val; }
		unsigned getArgId() { return mArgId; }

		void setDominatorSet(set<Node*> X) { mDominatorsSet = X; }
		set<Node*> getDominatorSet() { return mDominatorsSet; }

		bool isInstruction() { return llvm::isa<llvm::Instruction>(mLLVMValue); }
		llvm::Instruction* getInstruction() { return llvm::dyn_cast<llvm::Instruction>(mLLVMValue); }

		//Johnson elementary cycle
		void initCircuit();
		void addNode2BSet(Node* X);
		void unblockJohnson();

		//Duplicates while propagate
		void addCalleeDuplicateNode(Node* X, unsigned callSiteId)
		{
			if(NOTFOUND(mDuplicatesSet, X))
			{
				mDuplicatesSet.insert(X);
				mDuplicatesVec.push_back(X);
				mDuplicatesMap[callSiteId] = X;
			}
		}

		bool checkIfCalleeDuplicatesExist() { return (mDuplicatesVec.size() > 0); }

		void clearCalleeDuplicateNodes()
		{
			mDuplicatesVec.clear();
			mDuplicatesSet.clear();
			mDuplicatesMap.clear();
		}
		vector<Node*> getCalleeDuplicateNodes() { return mDuplicatesVec; }
		Node* getCalleeDuplicateNode(unsigned callSite);
		void setOriginalNode(Node* X) { mOriginalNode = X; }
		Node* getOriginalNode() { return mOriginalNode; }

		void initPropagatedValuesVector(unsigned num);
		double getPropagatedValue(unsigned idx) 
		{ 
			if(idx >= mPropagatedValues.size())
			{
				std::cerr << "Requested id "<<idx<<" in vector of size "<<mPropagatedValues.size()<<endl;
				if(getLLVMValue())
					std::cerr << "LLVM val : ";
				getLLVMValue()->print(std::cerr);
				if(getFunction())
					std::cerr << "Parent function "<<getFunction()->getName()<<endl;
				if(getOriginalNode()->getFunction())
					std::cerr << "Original function "<<getOriginalNode()->getFunction()->getName()<<endl;
				assert(0);
			}
			return mPropagatedValues[idx]; 
		}
		void setPropagatedValue(unsigned idx, double val);

		void attachArbitraryData(void* X) { mArbitraryData = X; }
        void* getAttachedArbitraryData() { return mArbitraryData; }

        void setASIPClone(Node* X) 
        {  
            mASIPClonedNode = X; 
            if(X)
                X->setASIPOriginal(this); 
        }
        Node* getASIPClone() { return mASIPClonedNode; }
        void setASIPOriginal(Node* X) { mASIPOriginalNode = X; }
        Node* getASIPOriginal() { return mASIPOriginalNode; }
};

#endif
