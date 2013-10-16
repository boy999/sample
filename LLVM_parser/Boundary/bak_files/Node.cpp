#include "Node.h"
#include "graph.h"

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
}

void Node::clear()
{
	mName.clear();
	mNumSuccessors = 0;
	mNumPredecessors = 0;
	mInEdges.clear();
	mOutEdges.clear();
    mInMap.clear();
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

	mPropagatedValues.clear();

	mTargetLoadIdWeights.clear();
	mTargetLoadIds.clear();

	mCalleeGraphVector.clear();
	mCalledFunctionVector.clear();
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
	mOutEdges.clear();
    
    mInMap.clear();
    mOutMap.clear();

	for(unsigned j=0;j<tmpEdgeList.size();++j)
		mGraph->eraseEdge(tmpEdgeList[j]);
	tmpEdgeList.clear();

	mNumSuccessors = mNumPredecessors = 0;
	mPredecessorNodes.clear();
	mSuccessorNodes.clear();
}

void Node::initPropagatedValuesVector(unsigned val)
{
	mPropagatedValues.clear();
	mPropagatedValues.resize(val);
	for(unsigned i=0;i<val;++i)
		mPropagatedValues[i] = -100.0;
}

void Node::setPropagatedValue(unsigned idx, double val)
{
	assert(idx < mPropagatedValues.size());
	mPropagatedValues[idx] = val;
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
	if(getLLVMValue() && (getLLVMValue()->getName()).length() > 0)
		format_stream << getLLVMValue()->getName();
	format_stream << "(" << getLLVMNodeId() << ")";

	std::string retVal;
	format_stream >> retVal;
	format_stream.clear();
	return retVal;
}

void Node::updateSelfWeight(double X)
{
	mSelfWeight += X;
	mSelfWeight = min(mSelfWeight, getNumDynamicInstances());
}
