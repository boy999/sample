#include "Node.h"
#include "graph.h"

vector<double> EMPTY_DOUBLE_VEC;
//Node functions
Node::Node(Graph* g, std::string name, unsigned id)
{
  clear();
  mGraph = g;
  mName = name;
  mNodeId = id;

  mDFSLevel = 0;
  mDFSVisited = false;
  mDFSSearchIdx = 0;
  mDFSPredecessor = 0;
  mInDFSPath = false;

  mNumDynamicInstances = 0;
  mSelfWeight = 1.0;

  mLLVMValue = 0;

  mCallSiteId = -1;
  mFunction = 0;
  mArgId = 0;
  mCalledFunction = 0;
  mCalleeNode = 0;
  //mCalleeGraph = 0;

  mOriginalNode = this;
  //mPropagatedOutputVal = 0.0;
  mIsCriticalFlag = false;
  mIsOutputNodeFlag = false;


  mArbitraryData = (void*)0;

  mExternallyVisibleIdx = 100000000;

  mASIP_Writer = 0;
  mASIPClonedNode = 0;
  mASIPOriginalNode = 0;
  mIsDummyASIPBlock = false;
  mIsDummyPhiNode = false;

  mNumPathsToExit = 0;

  mImmDom = 0;

  mOutputToleranceThreshold = 0.05;

  mPropertiesVec.resize(NUM_NODE_PROPERTIES);
  for(unsigned i=0;i<NUM_NODE_PROPERTIES;++i)
    mPropertiesVec[i] = 0;
  mCriticalityTypeMask = 0;
}

void Node::clear()
{
  mName.clear();
  mNumSuccessors = 0;
  mNumPredecessors = 0;
  mInEdges.clear();
  mInMap.clear();
  mOutEdges.clear();
  mOutMap.clear();
  mPredecessorNodes.clear();
  mSuccessorNodes.clear();
  mType = 0;
  mGraph = 0;
  mSCC = 0;

  mJohnsonBSet.clear();

  mDuplicatesSet.clear();
  mDuplicatesVec.clear();
  mDuplicatesMap.clear();
  mInstructionNodes.clear();

  mExternPropagatedValues.clear();
  mInternalPropagatedValues.clear();
  mOutputPropagatedValues.clear();

  mTargetLoadIdWeights.clear();
  mTargetLoadIds.clear();
  mSrcStoreIdWeights.clear();
  mSrcStoreIds.clear();

  mCalleeGraphVector.clear();
  mCalledFunctionVector.clear();

  mBlocksBeforePostDom.clear();

  mDominanceSet.clear();
  mDominatorSet.clear();
  mDominanceFrontier.clear();
  mOldDominanceSet.clear();
  mDominatorsVec.clear();

  mPropertiesVec.clear();
}


void Node::addInEdge(Edge* e)
{
  assert(e);
  assert(e->getPred());
  ++mNumPredecessors;
  mInEdges.push_back(e);
  mInMap[e->getPred()] = e;
  mPredecessorNodes.push_back(e->getPred());
}

void Node::eraseInEdge(Edge* e)
{
  vector<Edge*>::iterator eB = mInEdges.begin(), eE = mInEdges.end();
  vector<Node*>::iterator nB = mPredecessorNodes.begin();
  for(;eB != eE;eB++, nB++)
    if((*eB) == e)
      break;
  mInEdges.erase(eB);
  mPredecessorNodes.erase(nB);
  mInMap.erase(mInMap.find(e->getPred()));
  --mNumPredecessors;
}

void Node::addOutEdge(Edge* e)
{
  assert(e);
  assert(e->getSucc());
  ++mNumSuccessors;
  mOutEdges.push_back(e);
  mOutMap[e->getSucc()] = e;
  mSuccessorNodes.push_back(e->getSucc());
}

void Node::eraseOutEdge(Edge* e)
{
  vector<Edge*>::iterator eB = mOutEdges.begin(), eE = mOutEdges.end();
  vector<Node*>::iterator nB = mSuccessorNodes.begin();
  for(;eB != eE;eB++, nB++)
    if((*eB) == e)
      break;
  mOutEdges.erase(eB);
  mOutMap.erase(mOutMap.find(e->getSucc()));
  mSuccessorNodes.erase(nB);
  --mNumSuccessors;
}

Edge* Node::deleteEdge(Node*node, NodeOrderType t)
{
  EdgeVector tmpList;
  Edge* tmp;
  if(t == PREDECESSORS)
    tmpList = mInEdges;
  else
    tmpList = mOutEdges;

  EdgeVectorIterator edgeBegin = tmpList.begin(), edgeEnd = tmpList.end();
  for(;edgeBegin != edgeEnd; edgeBegin++)
  {
    if(t == PREDECESSORS)
    {
      if((*edgeBegin)->getPred() == node)
      {
	tmp = (*edgeBegin);
	assert(tmp);
	tmpList.erase(edgeBegin);
	mInEdges = tmpList;
	mInMap.erase(mInMap.find(tmp->getPred()));
	mNumPredecessors--;
	return tmp;
      }
    }
    else
      if((*edgeBegin)->getSucc() == node)
      {
	tmp = (*edgeBegin);
	assert(tmp);
	tmpList.erase(edgeBegin);
	mOutEdges = tmpList;
	mOutMap.erase(mOutMap.find(tmp->getSucc()));
	mNumSuccessors--;
	return tmp;
      }
  }
  return 0;
}

vector<Node*> Node::getSuccessors()
{
  return mSuccessorNodes;
}

vector<Node*> Node::getPredecessors()
{
  return mPredecessorNodes;
}

void Node::initCircuit()
{
  mJohnsonBSet.clear();
  markDFSVisited(false);
}

void Node::addNode2BSet(Node* Y)
{
  if(NOTFOUND(mJohnsonBSet, Y))
    mJohnsonBSet.insert(Y);
}

void Node::unblockJohnson()
{
  markDFSVisited(false);
  set<Node*>::iterator sB = mJohnsonBSet.begin(), sE = mJohnsonBSet.end();
  for(;sB != sE;sB++)
  {
    if((*sB)->isDFSVisited())
      (*sB)->unblockJohnson();
  }
  mJohnsonBSet.clear();
}

void Node::copyLLVMData(Node* X)
{
  mLLVMValue = X->getLLVMValue();
  mNumDynamicInstances = X->getNumDynamicInstances();
  mSelfWeight = X->getSelfWeight();
  mLLVMNodeId = X->getLLVMNodeId();
  mOriginalNode = X->getOriginalNode();
  mFunction = X->getFunction();
  mArgId = X->getArgId();

  mIsOutputNodeFlag = X->isOutputNode();
  mOutputNodeIdx = X->getOutputNodeIdx();
  mOutputToleranceThreshold = X->getOutputToleranceThreshold();
}

void Node::eraseEdges()
{
  vector<Edge*> tmpEdgeList;
  tmpEdgeList.clear();
  vector<Edge*>::iterator eB = mInEdges.begin(), eE = mInEdges.end();
  for(;eB != eE;eB++)
  {
    (*eB)->getPred()->eraseOutEdge((*eB));
    tmpEdgeList.push_back((*eB));
    //mGraph->eraseEdge((*eB));
  }
  eB = mOutEdges.begin();
  eE = mOutEdges.end();
  for(;eB != eE;eB++)
  {
    (*eB)->getSucc()->eraseInEdge((*eB));
    tmpEdgeList.push_back((*eB));
    //mGraph->eraseEdge((*eB));
  }
  mInEdges.clear();
  mInMap.clear();
  mOutEdges.clear();
  mOutMap.clear();

  for(unsigned j=0;j<tmpEdgeList.size();++j)
    mGraph->eraseEdge(tmpEdgeList[j]);
  tmpEdgeList.clear();

  mNumSuccessors = mNumPredecessors = 0;
  mPredecessorNodes.clear();
  mSuccessorNodes.clear();
}

void Node::initExternPropagatedValuesVector(unsigned val)
{
  mExternPropagatedValues.clear();
  mExternPropagatedValues.resize(val);
  for(unsigned i=0;i<val;++i)
    mExternPropagatedValues[i] = 0.0;
}

void Node::setExternPropagatedValue(unsigned idx, double val)
{
  assert(idx < mExternPropagatedValues.size());
  mExternPropagatedValues[idx] = val;
}

void Node::initInternalPropagatedValuesVector(unsigned numNodes)
{
  mInternalPropagatedValues.clear();
  mInternalPropagatedValues.resize(numNodes);
  for(unsigned i=0;i<numNodes;++i)
    mInternalPropagatedValues[i] = 0.0;

  //update self weight
  mInternalPropagatedValues[getId()] = mSelfWeight;

  //for successor edges
  for(unsigned i=0;i<mSuccessorNodes.size();++i)
  {
    unsigned num_instances = mSuccessorNodes[i]->getNumDynamicInstances();
    if(mSuccessorNodes[i]->getSCC() == getSCC())
      mInternalPropagatedValues[mSuccessorNodes[i]->getId()] = minVal(num_instances, 
	  mSuccessorNodes[i]->getSelfWeight());
    else
      mInternalPropagatedValues[mSuccessorNodes[i]->getId()] = minVal(num_instances, getSelfWeight() *
	  getSuccessorEdge(i)->getEdgeWeight() * mSuccessorNodes[i]->getSelfWeight());
  }
}

void Node::initOutputPropagatedValuesVector(unsigned val)
{
  if(getOriginalNode() == this)
  {
    mOutputPropagatedValues.clear();
    mOutputPropagatedValues.resize(val);
    for(unsigned i=0;i<val;++i)
      mOutputPropagatedValues[i] = 0.0;
  }
}

Node* Node::getCalleeDuplicateNode(unsigned idx)
{
  assert(!NOTFOUND(mDuplicatesMap, idx));
  return mDuplicatesMap[idx];
  //assert(idx < mDuplicatesVec.size());
  //return mDuplicatesVec[idx];
}

void Node::addTargetLoad(unsigned idx, double wgt)
{
  mTargetLoadIds.push_back(idx);
  mTargetLoadIdWeights.push_back(wgt);
}

void Node::addSrcStore(unsigned idx, double wgt)
{
  mSrcStoreIds.push_back(idx);
  mSrcStoreIdWeights.push_back(wgt);
}

std::string Node::getName()
{
  stringstream format_stream(stringstream::in | stringstream::out);
  //if(getLLVMValue() && (getLLVMValue()->getName()).length() > 0)
  //format_stream << getLLVMValue()->getName();
  //format_stream << "(" << getLLVMNodeId() << ")";
  format_stream << mName<<"_" << getLLVMNodeId();

  std::string retVal;
  format_stream >> retVal;
  format_stream.clear();
  return retVal;
}

void Node::updateSelfWeight(double X)
{
  mSelfWeight += X;
  mSelfWeight = minVal(mSelfWeight, getNumDynamicInstances());
}

void Node::addBlockBeforePostDom(Node* X)
{
  mBlocksBeforePostDom.push_back(X);
}

vector<Node*>& Node::getBlocksBeforePostDom()
{
  return mBlocksBeforePostDom;
}

void Node::markCritical() 
{
  if(!isCritical())
  { 
    mIsCriticalFlag = true; 
    getParentGraph()->addCriticalNode(this);
    if(getOriginalNode() != this)
      getOriginalNode()->markCritical();
    if(getCalleeNode() != 0 && llvm::isa<llvm::Instruction>(getCalleeNode()->getLLVMValue()))
      getCFG()->getNode(getCalleeNode()->getParentBasicBlock())->markCritical();
    else
      if(getInstruction())
	getCFG()->getNode(getParentBasicBlock())->markCritical();
  }
  mCriticalityTypeMask |= (1 << Graph::mCriticalityTypeMask);
}

Graph* Node::getCFG(){ return mGraph->getCFG(); }
Graph* Node::getDFG(){ return mGraph->getDFG(); }

Edge* Node::getSuccessorEdge(Node* Y)
{
  if(NOTFOUND(mOutMap, Y))
    cerr << "Successor node "<<Y->getName()<<" not found for node "<<getName()<<endl;
  assert(!NOTFOUND(mOutMap, Y));
  return mOutMap[Y];
}

void Node::setDominatorSet(set<Node*> domSet)
{
  mDominatorSet.clear();
  mDominatorSet = domSet;
  for(set<Node*>::iterator sB = domSet.begin(), sE = domSet.end();sB != sE;sB++)
    (*sB)->addToDominanceSet(this);
}

void Node::addToDominanceSet(Node* X)
{
  mDominanceSet.insert(X);
}


void Node::clearDominatorInfo()
{
  mDominanceSet.clear();
  mDominanceFrontier.clear();
  mDominatorSet.clear();
  mDominatorsVec.clear();
}

void Node::setLLVMId(unsigned id) 
{ 
  mLLVMNodeId = id; 
  if(getParentGraph()->getMinLLVMNodeId() > id)
    getParentGraph()->setMinLLVMNodeId(id);
}
