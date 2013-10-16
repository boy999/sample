#include "graph.h"
#include "SCC.h"
#include "GraphBuilder.h"
#include "UtilityFunctions2.h"
#include "ASIPNode.h"

#define INCLUDE_PROPAGATE_PART_IN_JOHNSON 1

void replacedotsWithUnderscore(string& name)
{
	for(unsigned i=0;i<name.length();++i)
		if(name[i] == '.')
			name[i] = '_';
}

bool sameCalleeFunction(vector<Node*> nodeVec)
{
	bool isSameCalleeFunction = true;
	int currCallSiteId = nodeVec[0]->getCallSiteId();
	for(unsigned i=0;i<nodeVec.size();++i)
	{
		if(nodeVec[i]->getCallSiteId() < 0)			//not part of any callee
		{
			isSameCalleeFunction = false;
			break;
		}
		if(currCallSiteId != nodeVec[i]->getCallSiteId())	//part of different callee
		{
			isSameCalleeFunction = false;
			break;
		}
	}
	return isSameCalleeFunction;
}

//Graph functions
Graph::Graph()
{
	mFunction = 0;
	mSCCGraph = 0;
	mExternallyVisibleSubgraph = 0;
	mHasBeenPropagated = false;
	clear();
}

Graph::~Graph()
{
	clear();
	if(mSCCGraph)
		delete mSCCGraph;
	if(mExternallyVisibleSubgraph)
		delete mExternallyVisibleSubgraph;
}

void Graph::clear()
{
	mTGFFFileName.clear();
	mMetroFileName.clear();
	mName.clear();

	mId2Edge.clear();
	mId2Node.clear();

	mLLVM2Node.clear();
	mLLVM2Edge.clear();
	
	mExternallyVisibleNodes.clear();
	mExternallyVisibleNodeSet.clear();
	mCalleeExternallyVisibleNodes.clear();

	for(unsigned i=0;i<mSCCVector.size();++i)
		delete mSCCVector[i];
	mSCCVector.clear();

	if(mSCCGraph)
		delete mSCCGraph;

	EdgeIterator eB = mEdgeList.begin(), eE = mEdgeList.end();
	for(;eB != eE;eB++)
		delete (*eB);
	NodeIterator nB = beginNode(), nE = endNode();
	for(;nB != nE;nB++)
		delete (*nB);
	mEdgeList.clear();
	mNodeList.clear();
}

void Graph::tiebreak(map<Node*,bool>& search, vector<Node*>& addVec)
{
  Graph* cloneGraph = new Graph();
  for(unsigned j=0;j<mNodeList.size();++j)
  {
    mNodeList[j]->setASIPClone(0);
    if(NOTFOUND(search, mNodeList[j]))
    {
      Node* n = cloneGraph->createNode();
      mNodeList[j]->setASIPClone(n);
    }
  }
  for(unsigned j=0;j<mNodeList.size();++j)
  {
    if(mNodeList[j]->getASIPClone())
    {
      std::vector<Node*> predVector;
      predVector.clear();
      predVector = mNodeList[j]->getPredecessors();
      for(unsigned k=0;k<predVector.size();++k)
	if(predVector[k]->getASIPClone())
	  cloneGraph->createEdge(predVector[k]->getASIPClone(), mNodeList[j]->getASIPClone());
    }
  }
  cloneGraph->createSCCGraph();
  SCC* firstSCC = cloneGraph->getSCCGraph()->getNode((unsigned)0)->getSCC();
  assert(firstSCC);

  for(unsigned j=0;j<firstSCC->size();++j)
  {
    Node* currNode = firstSCC->getNode(j);
    Node* origNode = currNode->getASIPOriginal();
    std::vector<Node*> predVector;
    predVector.clear();
    predVector = origNode->getPredecessors();
    bool allow = true;
    bool oneOutsideSCC = false;
    for(unsigned k=0;k<predVector.size();++k)
    {
      if(predVector[k]->getASIPClone() == 0)
	oneOutsideSCC = true;
      else
	allow = allow && (predVector[k]->getASIPClone()->getSCC() == firstSCC);
	  //((predVector[k]->getSCC() != currSCC) && !NOTFOUND(search, predVector[k])));
      if(allow == false)
	break;
    }
    predVector.clear();
    allow = allow && oneOutsideSCC;
    if(allow)
    {
      assert(origNode->getParentGraph() == this);
      cerr << "Tiebreak node "<<origNode->getName()<<endl;
      addVec.push_back(origNode);
      
      std::vector<Node*> predVector;
      predVector.clear();
      predVector = origNode->getPredecessors();
      for(unsigned k=0;k<predVector.size();++k)
	if(predVector[k]->getASIPClone() != 0)
	{
	  Edge* e = getEdge(predVector[k], origNode);
	  e->markBackEdge(true);
	}
      predVector.clear();
      break;
    }
  }
  delete cloneGraph;
}

void Graph::topoSort(bool reAssignIds)
{
  std::map<Node*,bool> search;
  std::vector<Node*> anotherList, tmpList;
  search.clear();
  anotherList.clear();

  unsigned numNodes = mNodeList.size();

  NodeIterator nodeBegin = mNodeList.begin(), nodeEnd = mNodeList.end(), eraseIt;

//  unsigned topoSortLevel = 0;
  while(anotherList.size() < numNodes)	
  {
    nodeBegin = mNodeList.begin();
    nodeEnd = mNodeList.end();
    tmpList.clear();
    for(; nodeBegin != nodeEnd; nodeBegin++)
    {
      if(allPredsGone(*nodeBegin, search))
      {
    //	(*nodeBegin)->setTopologicalLevel(topoSortLevel);
	    tmpList.push_back(*nodeBegin);
      }
    }


    if(tmpList.size() == 0)
    {
      cerr << "Running tiebreak\n";
      tiebreak(search, tmpList);
      if(tmpList.size() == 0)
      {
    	cerr << "Toposort did not return a single valid node\n";
    	dumpDot("error_cfg");
    	assert(0);
      }
      break;
    }
    nodeBegin = tmpList.begin();
    nodeEnd = tmpList.end();
    for(; nodeBegin != nodeEnd; nodeBegin++)
    {
      search[*nodeBegin] = 1;
      anotherList.push_back(*nodeBegin);
      //cerr << (*nodeBegin)->getName()<<" sorted\n";
    }
  //  ++topoSortLevel;
  }

  nodeBegin = anotherList.begin();
  nodeEnd = anotherList.end();
  mNodeList.clear();
  unsigned id = 0;
  for(; nodeBegin != nodeEnd; nodeBegin++)
  {
    if(reAssignIds)
      (*nodeBegin)->setId(id);
    mNodeList.push_back(*nodeBegin);
    ++id;	
    //std::cout <<(*nodeBegin)->getName()<<"\n";
  }
  anotherList.clear();
  search.clear();
  tmpList.clear();
}

bool Graph::allPredsGone(Node* n, std::map<Node*, bool> search)
{
  if(search.find(n) != search.end())
    return false;
  std::vector<Node*> predVector;
  predVector.clear();
  predVector = n->getPredecessors();
  for(unsigned i=0;i<predVector.size();++i)
    if(!(n->getPredecessorEdge(i)->isBackEdge()) && search.find(predVector[i]) == search.end())
    {
      //cerr << "False for "<<n->getName()<< " because of pred "<<predVector[i]->getName()<<endl;
      return false;
    }

  return true;
}

/*
void Graph::topoSort(bool reAssignIds)
{
	std::map<Node*,bool> search;
	std::vector<Node*> anotherList, tmpList;
	search.clear();
	anotherList.clear();

	unsigned numNodes = mNodeList.size();

	NodeIterator nodeBegin = mNodeList.begin(), nodeEnd = mNodeList.end(), eraseIt;

	while(anotherList.size() < numNodes)	
	{
        cerr << "size of anotherList: " << anotherList.size()
            <<" ; size of mNodeList: " << mNodeList.size() << endl;
		nodeBegin = mNodeList.begin();
		nodeEnd = mNodeList.end();
		tmpList.clear();
		for(; nodeBegin != nodeEnd; nodeBegin++)
		{
			if(allPredsGone(*nodeBegin, search))
			{
				tmpList.push_back(*nodeBegin);
			}
		}
		nodeBegin = tmpList.begin();
		nodeEnd = tmpList.end();

		for(; nodeBegin != nodeEnd; nodeBegin++)
		{
			search[*nodeBegin] = 1;
			anotherList.push_back(*nodeBegin);
		}
	}

	nodeBegin = anotherList.begin();
	nodeEnd = anotherList.end();
	mNodeList.clear();
	unsigned id = 0;
	for(; nodeBegin != nodeEnd; nodeBegin++)
	{
		if(reAssignIds)
			(*nodeBegin)->setId(id);
		mNodeList.push_back(*nodeBegin);
		++id;	
		//std::cout <<(*nodeBegin)->getName()<<"\n";
	}
	anotherList.clear();
	search.clear();
	tmpList.clear();
}

bool Graph::allPredsGone(Node* n, std::map<Node*, bool> search)
{
	if(search.find(n) != search.end())
		return false;
	std::vector<Node*> predVector;
	predVector.clear();
        predVector = n->getPredecessors();
	for(unsigned i=0;i<predVector.size();++i)
		if(!n->getPredecessorEdge(i)->isBackEdge() && search.find(predVector[i]) == search.end())
			return false;

	return true;
}
*/
void Graph::addNode(Node* n)
{
	mId2Node[n->getId()] = n;	
	mNodeList.push_back(n);
}
/*
void Graph::addArgNode(Node* n)
{
	mId2ArgNode[n->getId()] = n;	
	mArgNodeList.push_back(n);
}
*/
void Graph::eraseNode(Node* X)
{
	X->eraseEdges();
	if(X->getLLVMValue() && !NOTFOUND(mLLVM2Node, X->getLLVMValue()))
		mLLVM2Node.erase(mLLVM2Node.find(X->getLLVMValue()));
	NodeIterator nB = beginNode(), nE = endNode();
	for(;nB != nE;nB++)
		if((*nB) == X)
			break;
	assert(nB != nE);
	mNodeList.erase(nB);

	map<unsigned, Node*>::iterator pos = mId2Node.find(X->getId());
	if(pos != mId2Node.end() && (*pos).second == X)
		mId2Node.erase(pos);
	delete X;
}

void Graph::disconnectNode(Node* X)
{
	X->eraseEdges();
}

void Graph::addEdge(Edge* e)
{
	assert(e);
	assert(e->getPred());
	assert(e->getSucc());

	mId2Edge[e->getId()] = e;
	mEdgeList.push_back(e);
	
	e->getPred()->addOutEdge(e);
	e->getSucc()->addInEdge(e);
}

void Graph::eraseEdge(Edge* e)
{
	if(e->getPred()->getLLVMValue() && e->getSucc()->getLLVMValue())
		mLLVM2Edge.erase(mLLVM2Edge.find(make_pair(e->getPred()->getLLVMValue(), e->getSucc()->getLLVMValue())));
	EdgeIterator eB = mEdgeList.begin(), eE = mEdgeList.end();
	for(;eB != eE;eB++)
		if((*eB) == e)
			break;
	assert(eB != eE);
	mEdgeList.erase(eB);
	mId2Edge.erase(e->getId());

	delete e;
}

Node* Graph::getNodeFromId(unsigned id)
{
	if(mId2Node.find(id) == mId2Node.end())
	{
		cerr << "Node with id "<<id<<" not found\n";
		assert(0);
	}
	return mId2Node[id];
}

Edge* Graph::getEdgeFromId(unsigned id)
{
	if(mId2Edge.find(id) == mId2Edge.end())
	{
		cerr << "Edge with id "<<id<<" not found\n";
		assert(0);
	}
	return mId2Edge[id];
}

std::vector<Node*> Graph::getPredecessors(Node* n)
{
	std::vector<Node*> nodeVector;
	nodeVector.clear();
	nodeVector = n->getPredecessors();
	return nodeVector;
}

std::vector<Node*> Graph::getSuccessors(Node* n)
{
	std::vector<Node*> nodeVector;
	nodeVector.clear();

	nodeVector = n->getSuccessors();
	return nodeVector;
}

void Graph::dumpDot(string filePrefix)
{
	if(getNumNodes() > 50)
	{
		cerr << "Too many nodes, not creating dot file\n";
		return;
	}

	string filename = "graphs/"+filePrefix+".dot";
	ofstream dotOut;
	unsigned i;
	dotOut.open(filename.c_str());

	dotOut << "digraph G {\n";
	NodeIterator nodeBegin = mNodeList.begin(), nodeEnd = mNodeList.end();
	vector<Node*>nodeVector;
	stringstream format_stream(stringstream::in | stringstream::out);
	for(;nodeBegin != nodeEnd;nodeBegin++)
	{
		format_stream.clear();
		string src_name;
        string src_tmp;

		//if((*nodeBegin)->getLLVMValue() && (*nodeBegin)->getLLVMValue()->getName())
		if((*nodeBegin)->getLLVMValue() && ((*nodeBegin)->getLLVMValue()->getName()).length() > 0)
		{
			format_stream << (*nodeBegin)->getLLVMValue()->getName();
			format_stream << "_";
		}
        
        format_stream >> src_tmp;
        if (src_tmp.length() == 0)
        {
            format_stream.clear();
            cerr << "###Node without name: id: " << (*nodeBegin)->getLLVMNodeId() 
                << "; node name: " << (*nodeBegin)->getNodeName() << endl;
            format_stream << (*nodeBegin)->getNodeName();
            format_stream << "_";
        }
        else
        {
            format_stream.clear();
            format_stream << src_tmp;
        }
		format_stream << (*nodeBegin)->getLLVMNodeId();
		format_stream >> src_name;
		format_stream.clear();
		replacedotsWithUnderscore(src_name);

		nodeVector.clear();
		nodeVector = getSuccessors((*nodeBegin));

		for(i=0;i<nodeVector.size();++i)
		{
			string dst_name;
			string dst_tmp;
			if(nodeVector[i]->getLLVMValue() && (nodeVector[i]->getLLVMValue()->getName()).length()>0)
				format_stream << nodeVector[i]->getLLVMValue()->getName()<< "_";
            
            format_stream >> dst_tmp;
            if (dst_tmp.length() == 0)
            {
                format_stream.clear();
                cerr << "###Node without name: id: " << nodeVector[i]->getLLVMNodeId() 
                    << "; node name: " << nodeVector[i]->getNodeName() << endl;
                format_stream << nodeVector[i]->getNodeName();
                format_stream << "_";
            }
            else
            {
                format_stream.clear();
                format_stream << dst_tmp;
            }


			format_stream << nodeVector[i]->getLLVMNodeId();
			format_stream >> dst_name;
			format_stream.clear();
			replacedotsWithUnderscore(dst_name);

			dotOut << src_name <<"->"<<dst_name;
			double edgeWeight = (*nodeBegin)->getSuccessorEdge(i)->getEdgeWeight();
			if(edgeWeight > 0)
				dotOut<<" [label=\""<<edgeWeight<<"\"]";
			dotOut << "\n";

		}
	}
	dotOut << "}";
	dotOut.close();

	string command = "dot -Tpng "+filename+" > images/"+filePrefix+".png";
	system(command.c_str());
}

Node* Graph::createNode(string name, unsigned nodeType)
{
	Node* n = 0;
	if(name == "")
		name = "node_"+getNumNodes();
	switch(nodeType)
	{
		case ASIP_NODE_TYPE:
			n = new ASIPNode(this, name, getNumNodes());
			break;
    //    case ARG_NODE_TYPE:
    //       n = new Node(this, name, getArgNumNodes());
    //        addArgNode(n);
		default:
			n = new Node(this, name, getNumNodes());
			break;
	}
    addNode(n);
	return n;
}

Node* Graph::createNode(llvm::Value* lVal, unsigned nodeType)
{
    string nodeName = lVal->getName();
    cerr << "Creating Node: " << nodeName << endl;   
    llvm::BranchInst* brInst =llvm::dyn_cast<llvm::BranchInst>(lVal);
    if (brInst)
    {
        cerr << "##Creating Node Branch Inst Name: " << brInst->getName() << endl;
        cerr << "##Creating Node Branch Inst Parent Name: " << brInst->getParent()->getName() << endl;
        nodeName = brInst->getParent()->getName()+"_BR"+brInst->getName();
        cerr << "##Creating Node Name: " << nodeName << endl;
    }
    if(nodeName == "")
    { 
        llvm::Instruction* inst = llvm::dyn_cast<llvm::Instruction>(lVal);
        if(inst)
            nodeName = inst->getOpcodeName();
        else
            if(llvm::isa<llvm::Constant>(lVal))
                nodeName = "constant";
            else if(llvm::isa<llvm::Argument>(lVal))
                nodeName = "argument";
            else if (llvm::isa<llvm::BranchInst>(lVal))
            {
                assert(brInst->getParent());
                nodeName = brInst->getParent()->getName()+"_BR";
            }
    } 

    if(llvm::isa<llvm::Constant>(lVal))
    {   
        Node* n = getNodeIfExists(lVal);
        if(n)
            return n;
    }

    if(llvm::isa<llvm::PointerType>(lVal->getType()))
    {
        Node* n = getNodeIfExists(lVal);
        if (n)
            return n;
        else
            nodeName = "pointer";
    }
//	Node* n = createNode(lVal->getName(), nodeType);
	Node* n = createNode(nodeName, nodeType);
	mLLVM2Node[lVal] = n;
	n->setLLVMValue(lVal);
	n->setFunction(llvm::GraphBuilder::getFunction(lVal));
	return n;
}

Edge* Graph::createEdge(llvm::Value* pred, llvm::Value* succ)
{

	if(NOTFOUND(mLLVM2Node, pred))
	{
		cerr << "No node created for pred llvm val : ";
		pred->print(cerr);
		assert(0);
	}
	if(NOTFOUND(mLLVM2Node, succ))
	{
		cerr << "No node created for succ llvm val : ";
		succ->print(cerr);
		assert(0);
	}
	if(!NOTFOUND(mLLVM2Edge, make_pair(pred,succ)))
		return mLLVM2Edge[make_pair(pred, succ)];
	Edge* e = new Edge(pred->getName()+"_"+succ->getName(), getNumEdges());
	
	e->setPred(mLLVM2Node[pred]);
	e->setSucc(mLLVM2Node[succ]);
	
	mLLVM2Edge[make_pair(pred, succ)] = e;

	addEdge(e);

	return e;
}

Edge* Graph::createEdge(Node* n1, Node* n2)
{
	Edge* e = new Edge(n1->getName()+"_"+n2->getName(), getNumEdges());
	
	e->setPred(n1);
	e->setSucc(n2);

	if(n1->getLLVMValue() && n2->getLLVMValue())	
		mLLVM2Edge[make_pair(n1->getLLVMValue(), n2->getLLVMValue())] = e;
	addEdge(e);
	return e;
}

void Graph::setEdgeWeight(llvm::Value* pred, llvm::Value* succ, double value)
{
	assert(!NOTFOUND(mLLVM2Edge, make_pair(pred, succ)));
	mLLVM2Edge[make_pair(pred, succ)]->setWeight(value);
}

void Graph::markBackEdge(llvm::Value* pred, llvm::Value* succ, double value)
{
	assert(!NOTFOUND(mLLVM2Edge, make_pair(pred, succ)));
	mLLVM2Edge[make_pair(pred, succ)]->markBackEdge(true);
}


Node* Graph::getNode(llvm::Value* X)
{
    if (NOTFOUND(mLLVM2Node, X))
    {
        cerr << "in getNode function, NOTFOUND LLVMVALUE: ";
        X->print(cerr);
        cerr << endl;
    }
	assert(!NOTFOUND(mLLVM2Node, X));
	return mLLVM2Node[X];
}

Node* Graph::getNodeIfExists(llvm::Value* X)
{
	if(NOTFOUND(mLLVM2Node, X))
		return (Node*)0;
	else
		return mLLVM2Node[X];
}

void Graph::initDFS()
{
	NodeIterator nB = beginNode(), nE = endNode();
	for(;nB != nE;nB++)
	{
		Node* currNode = (*nB);
		currNode->markDFSVisited(false);
		currNode->setDFSLevel(0);
		currNode->setDFSSearchIdx(0);
		currNode->setDFSPredecessor(0);
	}
}

bool Graph::DFSVisit(Node* currNode, unsigned& level, unsigned searchIdx, bool exitOnLoop, bool reverse, bool storeSCCs)
{
	currNode->markDFSVisited(true);
	currNode->setDFSSearchIdx(searchIdx);
	currNode->markInDFSPath(true);
	if(storeSCCs)
	{
		mSCCVector[mSCCVector.size() - 1]->addNode(currNode);
	}
	vector<Node*> succVector = (reverse ? currNode->getPredecessors() : currNode->getSuccessors());
	for(unsigned i=0;i<succVector.size();++i)
	{
		//cerr << "Node  "<<currNode->getLLVMNodeId()<< " successor "<<succVector[i]->getLLVMNodeId()<<endl;
		//cerr << "visited "<<succVector[i]->isDFSVisited()<< " search idx "<<succVector[i]->getDFSSearchIdx()<<endl;
		if(succVector[i]->getLLVMNodeId() == currNode->getLLVMNodeId())
			assert(succVector[i] == currNode);
		if(succVector[i]->isDFSVisited())
		{
			//if(exitOnLoop && succVector[i]->isInDFSPath() == searchIdx)
			if(exitOnLoop && succVector[i]->isInDFSPath())
			{
				cerr << "First detected cycle\n";
				return true;
			}
		}
		else
		{
			succVector[i]->setDFSPredecessor(currNode);
			if(DFSVisit(succVector[i], level, searchIdx, exitOnLoop, reverse, storeSCCs))
				return true;
		}
	}
	++level;
	currNode->setDFSLevel(level);
	currNode->markInDFSPath(false);
	//cerr << "Node  "<<currNode->getLLVMNodeId()<< " level "<<level<<endl;
	return false;
}

bool Graph::DFS(bool exitOnLoop, bool reverse, bool storeSCCs)
{
	initDFS();
	unsigned level = 1;
	NodeIterator nB = beginNode(), nE = endNode();
	unsigned searchIdx = 1;		//0 is default, invalid
	for(;nB != nE;nB++)
	{
		Node* currNode = (*nB);
		if(!currNode->isDFSVisited())
		{
			if(storeSCCs)
				mSCCVector.push_back(new SCC());
			
			if(DFSVisit(currNode, level, searchIdx, exitOnLoop, reverse, storeSCCs))
				return true;
			++searchIdx;
		}
	}

	if(storeSCCs)
		for(unsigned i=0;i<mSCCVector.size();++i)
			if(mSCCVector[i]->size() > 1)
				mSCCVector[i]->print(cerr);
	//cerr << "\n";
	return false;
}

void Graph::createSCCGraph()
{
	identifySCCs();
	mSCCGraph = new Graph();
	
	for(unsigned i = 0;i<mSCCVector.size();++i)
	{
		Node* currSCCNode = mSCCGraph->createNode();
		currSCCNode->setSCC(mSCCVector[i]);
		mSCCVector[i]->setSCCGraphNode(currSCCNode);
	}
		
	set<SCC*> adjSCCs;
	for(unsigned i = 0;i<mSCCVector.size();++i)
	{
		adjSCCs.clear();
		for(unsigned j=0;j<mSCCVector[i]->size();++j)
		{
			Node* currNode = mSCCVector[i]->getNode(j);
			Node* currSCCNode = mSCCVector[i]->getSCCGraphNode();
			vector<Node*> adjNodes = currNode->getSuccessors();
			for(unsigned l=0;l<adjNodes.size();++l)
			{
				SCC* succSCC = adjNodes[l]->getSCC();
				if(succSCC != mSCCVector[i] && NOTFOUND(adjSCCs, succSCC))	//diff scc
				{
					adjSCCs.insert(succSCC);
					//assert(succSCC->getSCCGraphNode());
					mSCCGraph->createEdge(currSCCNode, succSCC->getSCCGraphNode());
				}
			}
		}
	}
	adjSCCs.clear();
//	mSCCGraph->topoSort(true);
}

void Graph::identifySCCs()	//Tarjan's method
{
	for(unsigned j=0;j<mSCCVector.size();++j)
		delete mSCCVector[j];
	mSCCVector.clear();

	NodeIterator nB = beginNode(), nE = endNode();
	NodeIterator start = nB;
	for(;nB != nE;nB++)
		(*nB)->setSCC(0);

	DFS(false, false, false);
	sort(start, nE, Node::DFSCompare);
	DFS(false, true, true);
}

SCC* Graph::getFirstNonTrivialSCC()
{
	for(unsigned i=0;i<mSCCVector.size();++i)
		if(mSCCVector[i]->size() > 1)
			return mSCCVector[i];
	return 0;
}

//Johnson's cycle enumeration technique
void Graph::initCircuit()
{
	mNumCycles = 0;
	NodeIterator nB = beginNode(), nE = endNode();
	for(;nB != nE;nB++)
		(*nB)->initCircuit();
}

void Graph::update_propagate_cycle(vector<Node*> currPath, double weight)
{
	
	//if all the nodes in this cycle are part of the same callee function, don't update self weights again
	bool isSameCalleeFunction = sameCalleeFunction(currPath);
	//since this is a cycle, self weights are updated - weight is the product of edge weights of the cycle
	//hence self weight is updated by 1/(1-weight) if weight < 1 (geometric series)
	//else by num instances
	if(!isSameCalleeFunction)
	{
		//cerr << "Updating a cycle weight by "<<weight<<endl;
		for(unsigned i=0;i<currPath.size();++i)
		{
			if(weight >= 1)
				currPath[i]->updateSelfWeight(currPath[i]->getNumDynamicInstances());
			else
				currPath[i]->updateSelfWeight(min((double)1/(1-weight), 
							currPath[i]->getNumDynamicInstances()));
		}
	}
}

bool Graph::Circuit(Node* rootNode, Node* s, vector<Node*> currPath, double weight, bool& cutOffReached)
{
	currPath.push_back(s);
	s->markDFSVisited(true);
	vector<Node*> succNodes = s->getSuccessors();
	bool returnVal = false;
	//cerr << "Circuit for : ";
	//s->getLLVMValue()->print(cerr);
	//cerr << "Curr node "<<s->getName()<< " Path weight "<<weight<<endl;
	for(unsigned i=0;i<succNodes.size();++i)
	{
		if(succNodes[i] == rootNode)
		{
			++mNumCycles;
			//if(mNumCycles % 10000 == 0)
				//cerr << "Num cycles "<<mNumCycles<<endl;
#ifdef INCLUDE_PROPAGATE_PART_IN_JOHNSON
			update_propagate_cycle(currPath, weight*s->getSuccessorEdge(i)->getEdgeWeight());
			//cut off	
			if((mNumCycles >= 200000 && rootNode->getSelfWeight() >= rootNode->getNumDynamicInstances())
					|| mNumCycles >= 1000000)
			{
				cerr << "Cutoff reached\n"; 
				if(mNumCycles >= 1000000)
				{
					for(unsigned j=0;j<getNumNodes();++j)
						getNode(j)->updateSelfWeight(getNode(j)->getNumDynamicInstances());
				}
				cutOffReached = true;
			}
#endif
			//cerr << "Elementary cycle [ ";
			//for(unsigned j=0;j<currPath.size();++j)
				//cerr << currPath[j]->getName() << " ";
			//cerr <<"]\n";
			returnVal = true;
		}
		else
		{
			if(!succNodes[i]->isDFSVisited())
			{
				//if(s->getSuccessorEdge(i)->getEdgeWeight() < 0.0001)
				//cerr << "Why is edgeweight 0?\n";
				if(Circuit(rootNode, succNodes[i], currPath, weight*(s->getSuccessorEdge(i)->getEdgeWeight())
							, cutOffReached))
					returnVal = true;
			}
		}
		if(cutOffReached)
			break;
	}
	if(returnVal)
		s->unblockJohnson();
	else
		for(unsigned i=0;i<succNodes.size();++i)
			succNodes[i]->addNode2BSet(s);
			//s->addNode2BSet(succNodes[i]);
	return returnVal;

}


void Graph::Johnson_Elementary_Cycles()
{
	vector<Node*> currPath;
	currPath.clear();

	cerr << "Starting Johnson_Elementary_Cycles\n";
	for(unsigned i=0;i<mSCCVector.size();++i)
	{
		SCC* currSCC = mSCCVector[i];
		if(currSCC->size() < 2)		//trivial SCC
			continue;

#ifdef INCLUDE_PROPAGATE_PART_IN_JOHNSON
		//Check whether all nodes in this SCC have already been examined as part of callee function, 
		//if so don't check again
		bool isSameCalleeFunction = sameCalleeFunction(currSCC->getNodes());
		if(isSameCalleeFunction)
			continue;
#endif

		Graph* sccGraph = new Graph();
		map<Node*, Node*> nodePairMap;
		nodePairMap.clear();
	
		//Create subgraph induced by this SCC	
		for(unsigned j=0;j<currSCC->size();++j)
		{
			Node* currNode = sccGraph->createNode();
			currNode->copyLLVMData(currSCC->getNode(j));
			nodePairMap[currSCC->getNode(j)] = currNode;
		}
	
		for(unsigned j=0;j<currSCC->size();++j)
		{
			Node* currNode = currSCC->getNode(j);
			Node* sccNode = nodePairMap[currNode];
			for(unsigned k=0;k<currNode->getNumPredecessors();++k)
			{
				Edge* e = currNode->getPredecessorEdge(k);
				if(e->getPred()->getSCC() == currSCC)
				{
					assert(!NOTFOUND(nodePairMap, e->getPred()));
					Edge* currEdge = sccGraph->createEdge(nodePairMap[e->getPred()], sccNode);
					currEdge->copyData(e);
				}
			}
		}

		//Johnson's algorithm main part
		//for(unsigned j=0;j<currSCC->size()-1;++j)
		//{
		Node* s = 0;
		bool wasCutOff = false;
		SCC* firstSCC = 0;
		unsigned rootIdx = 0;
		do
		{
			if(!wasCutOff)
			{
				s = 0;
				sccGraph->identifySCCs();
				firstSCC = sccGraph->getFirstNonTrivialSCC();
				if(firstSCC)
				{
					rootIdx = 0;
					for(;rootIdx<firstSCC->size();++rootIdx)
					{
						Node* currNode = firstSCC->getNode(rootIdx);
						if(currNode->getSelfWeight() < currNode->getNumDynamicInstances())
						{
							s = currNode;
							break;
						}
					}
				}
			}
			if(firstSCC && s)
			{
				//assert(s);
				cerr << "\nRoot node for Johnson "<<s->getName()<<endl;
				//s->getLLVMValue()->print(cerr);
				
				sccGraph->initCircuit();
				currPath.clear();
				double weight = 1;
				wasCutOff = false;
				sccGraph->Circuit(s, s, currPath, weight, wasCutOff);

				//cerr << "Completed circuit for root node : ";
				//s->getLLVMValue()->print(cerr);
				if(!wasCutOff)
				{
					cerr << "Num cycles "<<sccGraph->getNumCycles()<<endl;
					sccGraph->disconnectNode(s);
					//sccGraph->eraseNode(s);
					//cerr << "Disconnecting node "<<s->getName()<<endl;
					//sccGraph->dumpDot("scc.dot");
				}
				else
				{
					s = 0;
					for(;rootIdx<firstSCC->size();++rootIdx)
					{
						Node* currNode = firstSCC->getNode(rootIdx);
						if(currNode->getSelfWeight() < currNode->getNumDynamicInstances())
						{
							s = currNode;
							break;
						}
					}
					if(s == 0)
						cerr << "Every node in the SCC has self weight > num dynamic instances\n";
				}

				//cerr << "Deleting root node\n";
			}
			else
				break;
		}while(s != 0);
			//}
		
		//update self weights in the original graph
		for(unsigned j=0;j<currSCC->size();++j)
		{
			Node* currNode = currSCC->getNode(j);
			Node* johnsonNode = nodePairMap[currNode];
			currNode->updateSelfWeight(johnsonNode->getSelfWeight());
		}

		nodePairMap.clear();
		delete sccGraph;
	}
	currPath.clear();
}

void Graph::buildDominatorTree()
{
	//assume DAG and topologically sorted
	NodeIterator nB, nE;

	nB = beginNode();
	nE = endNode();
	for(;nB != nE;nB++)
	{
		Node* currNode = (*nB);
		vector<Node*> predNodes = currNode->getPredecessors();
		set<Node*> domSet;
		set<Node*> selfSet;
		selfSet.clear();
		selfSet.insert(*nB);
		domSet.clear();
		if(predNodes.size() > 0)
			domSet = predNodes[0]->getDominatorSet();
		for(unsigned i=1;i<predNodes.size();++i)
			domSet = llvm::UtilityFunctions::setIntersect(domSet, predNodes[1]->getDominatorSet());
		domSet = llvm::UtilityFunctions::setUnion(selfSet, domSet);
		currNode->setDominatorSet(domSet);
		domSet.clear();
		selfSet.clear();
	}
}

void Graph::buildNearestDominatorMatrix(vector<vector<Node*> >& matrix)
{
	//should be topologically sorted and should be a DAG
	assert(!testForCycles());
	//topoSort(true);

	buildDominatorTree();

	//cerr << "Crash here 0\n";
	matrix.resize(mNodeList.size());
	for(unsigned i=0;i<mNodeList.size();++i)
	{
		matrix[i].resize(mNodeList.size());
		for(unsigned j=0;j<getNumNodes();++j)
			matrix[i][j] = 0;
	}

	NodeIterator nB, nE;
	nB = beginNode();
	nE = endNode();
	unsigned i=0,j=0;
	for(;nB != nE;nB++)
	{
		Node* pred = (*nB);
		NodeIterator iB = beginNode(), iE = endNode();
		j = 0;
		for(;iB != iE;iB++)
		{
			Node* succ = (*iB);
			if(pred != succ)
			{
				set<Node*> commonAnc = llvm::UtilityFunctions::setIntersect
					(pred->getDominatorSet(), succ->getDominatorSet());
				//if(commonAnc.size() > 0)
				//cerr << "Nodes "<<pred->getLLVMValue()->getName() << " and "<<succ->getLLVMValue()->getName()
				//<<" have "<<commonAnc.size()<< " common ancestors\n";
				set<Node*>::iterator sB = commonAnc.begin(), sE = commonAnc.end();
				Node* minNode = (*sB);
				for(;sB != sE;sB++)
					if(minNode->getId() < (*sB)->getId())
						minNode = (*sB);
				matrix[i][j] = minNode;
				matrix[j][i] = minNode;
				//cerr << "Setting dominator "<<i<<" "<<j<<minNode->getId()<<endl;
			}
			else
				matrix[i][j] = succ;
			++j;
		}
		++i;
	}
	//cerr << "Crash here "<<getNumNodes()<<"\n";
	for(unsigned i=0;i<getNumNodes();++i)			
		for(unsigned j=i+1;j<getNumNodes();++j)			
			if(matrix[i][j] != 0)
				cerr << "Nearest dominator of [ "<<mNodeList[i]->getLLVMValue()->getName()<< " "
					<<mNodeList[j]->getLLVMValue()->getName()<<" ] "<<matrix[i][j]->getName()<<endl;
	//cerr << "Crash here 2\n";
}

void Graph::propagate(vector<Node*> externVisibleNodes)
{
	createSCCGraph();
	Johnson_Elementary_Cycles();
	vector<Node*> sccNodes = mSCCGraph->getNodes();
	//Reverse topological order 
	for(int i=(int)sccNodes.size()-1;i>=0;--i)
	{
		Node* currSCCNode = sccNodes[i];
		SCC* currSCC = currSCCNode->getSCC();
		for(unsigned l=0;l<externVisibleNodes.size();++l)
		{
			double maxPropagateValue = -100.0;
			if(externVisibleNodes[l]->getSCC() == currSCC)
				maxPropagateValue = 1.0;
			else
				for(unsigned j=0;j<currSCC->size();++j)
				{
					Node* currNode = currSCC->getNode(j);
					vector<Node*> succNodes = currNode->getSuccessors();
					for(unsigned k=0;k<succNodes.size();++k)
					{
						Node* currSuccNode = succNodes[k];
						double edgeWeight = currNode->getSuccessorEdge(k)->getEdgeWeight();
						if(currSuccNode->getSCC() != currSCC)
						{
							double propValue = currSuccNode->getPropagatedValue(l)*edgeWeight;
							if(propValue > maxPropagateValue)
								maxPropagateValue = propValue;
						}
					}
					succNodes.clear();
				}
			if(maxPropagateValue > -1)
				for(unsigned j=0;j<currSCC->size();++j)
				{
					Node* currNode = currSCC->getNode(j);
					currNode->setPropagatedValue(l, min(maxPropagateValue * currNode->getSelfWeight(), 
								externVisibleNodes[l]->getNumDynamicInstances()));
				}
		}
	}
	sccNodes.clear();
	mHasBeenPropagated = true;
}

void Graph::addExternallyVisibleNode(Node* X)
{
	if(NOTFOUND(mExternallyVisibleNodeSet, X))
	{
		mExternallyVisibleNodeSet.insert(X);
		mExternallyVisibleNodes.push_back(X);
		//cerr << "For function "<<getFunction()->getName()<< " Added externally visible node "<<X->getLLVMValue()->getName()<<endl;
	}
}

void Graph::createExternallyVisibleSubGraph()
{
	mExternallyVisibleSubgraph = new Graph();
	for(unsigned i=0;i<getExternallyVisibleNodeVectorSize();++i)
	{
		Node* srcNode = getExternallyVisibleNode(i);
		assert(srcNode->getFunction() == getFunction());
		Node* newSrcNode = mExternallyVisibleSubgraph->createNode();
		//cerr << "Adding new externally visible node\n";
		newSrcNode->copyLLVMData(srcNode);
		addCalleeExternallyVisibleNode(newSrcNode);
		newSrcNode->markDFSVisited(false);
	}

	cerr << "Function "<<getFunction()->getName()<< " num extern visible nodes "<<
		getExternallyVisibleNodeVectorSize()<<endl;
	for(unsigned i=0;i<getExternallyVisibleNodeVectorSize();++i)
	{
		//vector<Node*> sameSCC;
		//sameSCC.clear();
		Node* srcNode = getExternallyVisibleNode(i);
		assert(srcNode->getFunction() == getFunction());
		Node* newSrcNode = getCalleeExternallyVisibleNode(i);
		assert(newSrcNode->getParentGraph() == mExternallyVisibleSubgraph);
		//sameSCC.push_back(newSrcNode);
		newSrcNode->markDFSVisited(true);
		for(unsigned j=i;j<getExternallyVisibleNodeVectorSize();++j)
		{
			if(i != j)
			{
				Node* dstNode = getExternallyVisibleNode(j);
				assert(dstNode->getFunction() == getFunction());
				Node* newDstNode = getCalleeExternallyVisibleNode(j);
				assert(newDstNode->getParentGraph() == mExternallyVisibleSubgraph);
				if(srcNode->getPropagatedValue(j) > -2)
				{
					Edge* e = mExternallyVisibleSubgraph->createEdge(newSrcNode, newDstNode);
					//cerr << "Created edge in externally visible sub-graph\n";
					//because we always multiply the self weight by edge weight in propagate
					//e->setEdgeWeight(srcNode->getPropagatedValue(j)/srcNode->getSelfWeight());
					e->setEdgeWeight(srcNode->getPropagatedValue(j));
				}
				if(dstNode->getPropagatedValue(i) > -2)
				{
					Edge* e = mExternallyVisibleSubgraph->createEdge(newDstNode, newSrcNode);
					//e->setEdgeWeight(dstNode->getPropagatedValue(i)/dstNode->getSelfWeight());
					e->setEdgeWeight(dstNode->getPropagatedValue(i));
				}
			}
		}

		////at least 2 nodes in the SCC
		//if(sameSCC.size() > 1)
		//{
			//for(unsigned j=0;j<sameSCC.size()-1;++j)
			//{
				//Edge* e = createEdge(sameSCC[j], sameSCC[j+1]);
				//e->setEdgeWeight(1.0);	//cycle hence, self weights are relevant
			//}
			//Edge* e = createEdge(sameSCC[sameSCC.size()-1], sameSCC[0]);
			//e->setEdgeWeight(1.0);	//cycle hence, self weights are relevant
		//}
		//sameSCC.clear();
	}
}

Edge* Graph::getEdge(Node* X, Node* Y)
{ 
    return X->getSuccessorEdge(Y);
} 

Edge* Graph::getEdge(llvm::Value* X, llvm::Value* Y)
{ 
//    return getEdge(X->getNode(), Y->getNode());
    assert(!NOTFOUND(mLLVM2Edge, make_pair(X,Y)));
    return mLLVM2Edge[make_pair(X,Y)];
} 

bool Graph::shouldBuildEdge(llvm::Value* X)
{   
    //if(isa<ConstantFP>(X) || isa<ConstantInt>(X)) 
    if(llvm::UtilityFunctions::isSimpleConstant(X))
        return false;
    //if(isa<Constant>(X) && !isa<ConstantExpr>(X) && !isa<GlobalVariable>(X))    //don't bother with constants
    //return false;
    if(!(getNodeIfExists(X)))
    {
        cerr << "### node doesn't exist: ";
        X->print(cerr);
        cerr << endl;
        createNode(X);
    }
    return true;
}   

/*
Node* Graph::getNodeIfExists(llvm::Value* X)
{ 
    if(NOTFOUND(mLLVM2Node, X))
        return (Node*)0;
    else
        return mLLVM2Node[X];
    if(!(llvm::isa<llvm::Constant>(X)))
        return X->getNode();
    else
    { 
        if(NOTFOUND(mLLVM2Node, X))
            return 0;
        else
            return mLLVM2Node[X];
    }
} 
*/
