#ifndef NODE_H
#define NODE_H

#include "headers.h"
#include "llvm_headers.h"

enum NodeClassTypeEnum
{
	NORMAL_NODE_TYPE=0,
	ASIP_NODE_TYPE
};


enum NodeOrderType
{
	PREDECESSORS,
	SUCCESSORS
};


enum NODE_PROPERTIES_ENUM
{
  SCC_SUCC_NODES_ADDED=0,
  NUM_NODE_PROPERTIES
};

typedef unsigned ProcTypeDef;
class Graph;
class SCC;
class Function;
class Edge;

namespace llvm
{
  class ASIP_Cluster;
}

enum CRITICALITY_TYPE_ENUM
{
  DFG_NMIN_AFFECTER=0,
  DFG_CRITICAL_1AFFECTER,
  CFG_CRITICAL_LOOP_EXIT,
  CFG_CRITICAL_LOOP_EXIT2,
  CFG_NMIN_BEFORE_POST_DOMINATOR,
  CFG_CRIT_BEFORE_POST_DOMINATOR,
  NUM_CRITICALITY_TYPES
};

class Node
{
  protected:
    std::vector<Edge*> mInEdges;
    map<Node*, Edge*> mInMap;
    std::vector<Edge*> mOutEdges;
    map<Node*, Edge*> mOutMap;
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

    //toposort
    unsigned mTopologicalLevel;

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

    //is this an output node
    bool mIsOutputNodeFlag;
    unsigned mOutputNodeIdx;
    
      //propagate data
    double mSelfWeight;
    vector<double> mExternPropagatedValues;	//there is one value for each node which is directly visible externally
    vector<double> mInternalPropagatedValues;	//there is one value for each graph node
    vector<double> mOutputPropagatedValues;	//there is one value for each program output

    //SCC and Johnson's cycles
    SCC* mSCC;
    set<Node*> mJohnsonBSet;

    //dominator
    set<Node*> mDominatorSet;
    set<Node*> mDominanceSet;
    set<Node*> mDominanceFrontier;
    set<Node*> mOldDominanceSet;
    vector<Node*> mDominatorsVec;
    Node* mImmDom;

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
    bool mIsDummyPhiNode;

    //Duplicates while running propagate
    set<Node*> mDuplicatesSet;
    vector<Node*> mDuplicatesVec;
    map<unsigned, Node*> mDuplicatesMap;
    Node* mOriginalNode;
    unsigned mExternallyVisibleIdx;
    vector<Node*> mInstructionNodes;  //instructions which are part of this basic block

    void* mArbitraryData;

    double mOutputToleranceThreshold;
    bool mIsCriticalFlag;
    unsigned mCriticalityTypeMask;

    //CFG related
    vector<Node*> mBlocksBeforePostDom;
    unsigned mNumPathsToExit;

    //ASIP related
    llvm::ASIP_Cluster* mASIP_Writer;
    unsigned mASIPInputIdx;
    unsigned mASIPOutputIdx;
    Node* mASIPClonedNode;
    Node* mASIPOriginalNode;
    bool mIsDummyASIPBlock;

    //boost related
    BoostNode mBoostNode; 
    vector<unsigned> mPropertiesVec;
  public:
    Node(Graph* g, std::string name, unsigned id);
    ~Node() { clear(); }
    std::string getName();
    void setName(string name) { mName = name; }
    unsigned getId() { return mNodeId; }
    void setId(unsigned id) { mNodeId = id; }

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
    Edge* getSuccessorEdge(unsigned i)
    {
      assert(i<mOutEdges.size());
      return mOutEdges[i];
    }

    Node* getPredecessor(unsigned idx)
    {
      assert(idx<mPredecessorNodes.size());
      return mPredecessorNodes[idx];
    }

    Node* getSuccessor(unsigned idx)
    {
      assert(idx<mSuccessorNodes.size());
      return mSuccessorNodes[idx];
    }

    Edge* getSuccessorEdge(Node* Y);

    Edge* getSuccessorEdgeIfExist(Node* Y)
    {
      if(!NOTFOUND(mOutMap, Y))
	return mOutMap[Y];
      else
	return (Edge*)0;
    }

    void setTopologicalLevel(unsigned val) { mTopologicalLevel = val; }
    unsigned getTopologicalLevel() { return mTopologicalLevel; }

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
    void setLLVMId(unsigned id);
    unsigned  getLLVMNodeId() { return mLLVMNodeId; }
    static bool LLVMNodeIdCompare(Node* X, Node* Y) { return X->getLLVMNodeId() < Y->getLLVMNodeId(); }
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

    //dominator info
    void clearDominatorInfo();
    void setDominatorSet(set<Node*> domSet);
    set<Node*> getDominatorSet() { return mDominatorSet; }
    void addToDominanceSet(Node* X);
    set<Node*> getDominanceSet() { return mDominanceSet; }
    void storeOldDominanceSet() { mOldDominanceSet.clear(); mOldDominanceSet = mDominanceSet; }
    set<Node*> getOldDominanceSet() { return mOldDominanceSet; }

    void setDominanceFrontier(set<Node*> X) { mDominanceFrontier.clear(); mDominanceFrontier = X;}
    set<Node*> getDominanceFrontier() { return mDominanceFrontier; }
    void setImmDom(Node* X) { mImmDom = X; }
    Node* getImmDom() { return mImmDom; }

    bool dominates(Node* X) { return !NOTFOUND(mDominanceSet, X); }
    bool inDominanceFrontier(Node* X) { return !NOTFOUND(mDominanceFrontier, X); }

    void setDominatorsVec(vector<Node*> X) { mDominatorsVec.clear(); mDominatorsVec = X; }
    vector<Node*> getDominatorsVec() { return mDominatorsVec; }

    bool isInstruction() { return llvm::isa<llvm::Instruction>(mLLVMValue); }
    llvm::Instruction* getInstruction() { return llvm::dyn_cast<llvm::Instruction>(mLLVMValue); }
    llvm::BasicBlock* getBasicBlock() { return llvm::dyn_cast<llvm::BasicBlock>(mLLVMValue); }
    llvm::BasicBlock* getParentBasicBlock() 
    { 
      llvm::Instruction* inst = getInstruction();
      assert(inst);
      return inst->getParent(); 
    }
    void setDummyPhiNodeFlag(bool val) { mIsDummyPhiNode = val; }
    bool isPhiNode() { return llvm::isa<llvm::PHINode>(mLLVMValue); }

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

    void addInstructionNode(Node* X) 
    { 
      assert(getLLVMValue() && llvm::isa<llvm::BasicBlock>(getLLVMValue()));
      mInstructionNodes.push_back(X); 
    }
    vector<Node*> getInstructionNodes() { return mInstructionNodes; }
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

    void initExternPropagatedValuesVector(unsigned num);
    void initInternalPropagatedValuesVector(unsigned num);
    void initOutputPropagatedValuesVector(unsigned num);
    double getExternPropagatedValue(unsigned idx) 
    { 
      if(idx >= mExternPropagatedValues.size())
      {
	std::cerr << "Requested id "<<idx<<" in vector of size "<<mExternPropagatedValues.size()<<endl;
	if(getLLVMValue())
	  std::cerr << "LLVM val : ";
	getLLVMValue()->print(std::cerr);
	if(getFunction())
	  std::cerr << "Parent function "<<getFunction()->getName()<<endl;
	if(getOriginalNode()->getFunction())
	  std::cerr << "Original function "<<getOriginalNode()->getFunction()->getName()<<endl;
	assert(0);
      }
      return mExternPropagatedValues[idx]; 
    }
    void setExternallyVisibleIdx(unsigned val) { mExternallyVisibleIdx = val; }
    unsigned getExternallyVisibleIdx() { return mExternallyVisibleIdx; }

    void setExternPropagatedValue(unsigned idx, double val);
    double getInternalPropagatedValue(unsigned idx)
    {
      assert(idx < mInternalPropagatedValues.size());
      return mInternalPropagatedValues[idx];
    }
    void setInternalPropagatedValue(unsigned idx, double val)
    {
      assert(idx < mInternalPropagatedValues.size());
      mInternalPropagatedValues[idx] = val;
    }
    double getOutputPropagatedValue(unsigned idx) 
    { 
      if(getOriginalNode() != this)
	return getOriginalNode()->getOutputPropagatedValue(idx);
      else
	return mOutputPropagatedValues[idx];
    }
    void setOutputPropagatedValue(unsigned  idx, double val)
    { 
      if(getOriginalNode() != this)
	getOriginalNode()->setOutputPropagatedValue(idx, val);
      else
	mOutputPropagatedValues[idx] = val; 
    }

    void attachArbitraryData(void* X) { mArbitraryData = X; }
    void* getAttachedArbitraryData() { return mArbitraryData; }


    //ASIP related
    llvm::ASIP_Cluster* getASIPCluster() { return (llvm::ASIP_Cluster*)mArbitraryData; }
    void setASIPCluster(llvm::ASIP_Cluster* X) { mArbitraryData = (void*)X; }
    //determines whether an ASIP produces this value to the rest of the application
    void setOutputByASIP(llvm::ASIP_Cluster* X) { mASIP_Writer = X; }
    bool isOutputByASIP(llvm::ASIP_Cluster* X) { return (mASIP_Writer == X); }
    //i/o idx
    void setASIPInputIdx(unsigned val) { mASIPInputIdx = val; }
    void setASIPOutputIdx(unsigned val) { mASIPOutputIdx = val; }
    unsigned getASIPInputIdx() { return mASIPInputIdx; }
    unsigned getASIPOutputIdx() { return mASIPOutputIdx; }
    //cloned node
    void setASIPClone(Node* X) 
    {  
      mASIPClonedNode = X; 
      if(X)
	X->setASIPOriginal(this); 
    }
    Node* getASIPClone() { return mASIPClonedNode; }
    void setASIPOriginal(Node* X) { mASIPOriginalNode = X; }
    Node* getASIPOriginal() { return mASIPOriginalNode; }
    void setDummyASIPBlock(bool val) { mIsDummyASIPBlock = val; }
    bool isDummyASIPBlock() { return mIsDummyASIPBlock; }


    //For output nodes
    void markOutputNode(bool val,unsigned idx) 
    { 
      mIsOutputNodeFlag = val; 
      mOutputNodeIdx = idx;
    }
    bool isOutputNode() { return mIsOutputNodeFlag; }
    unsigned getOutputNodeIdx() { return mOutputNodeIdx; }

    void setOutputToleranceThreshold(double val) 
    { mOutputToleranceThreshold = val;}
    double getOutputToleranceThreshold() { return mOutputToleranceThreshold; }
    
    void markCritical();
    
    bool isCritical() 
    { 
      if(getOriginalNode() == this)
	return mIsCriticalFlag; 
      else
	return getOriginalNode()->isCritical();
    }
    unsigned getCriticalityTypeMask() { return mCriticalityTypeMask; }

    //CFG related
    void addBlockBeforePostDom(Node* X);
    vector<Node*>& getBlocksBeforePostDom();

    void setNumPathsToExit(unsigned val) { mNumPathsToExit = val; }
    unsigned getNumPathsToExit() { return mNumPathsToExit; } 

    Graph* getCFG();
    Graph* getDFG();

    void setBoostNode(BoostNode e) { mBoostNode = e; }
    BoostNode getBoostNode() { return mBoostNode; }

    void resetProperty(unsigned idx, unsigned val=0) { mPropertiesVec[idx] = val; }
    void setProperty(unsigned idx, unsigned val) 
    { 
      assert(idx < NUM_NODE_PROPERTIES);
      mPropertiesVec[idx] = val; 
    }
    unsigned getProperty(unsigned idx) 
    { 
      assert(idx < NUM_NODE_PROPERTIES);
      return mPropertiesVec[idx]; 
    }
};

#endif
