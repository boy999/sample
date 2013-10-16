#include "graph.h"
#include "SCC.h"
#include "GraphBuilder.h"
#include "UtilityFunctions2.h"
#include "ASIPNode.h"
#include "LoopDataStructure.h"
#include <bitset>

#define INCLUDE_PROPAGATE_PART_IN_JOHNSON 1

unsigned Graph::mCriticalityTypeMask = 0;

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
  mMinLLVMNodeId = 1000000000;
  mLoopDataStructure = 0;
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

  EdgeIterator eB = mEdgeList.begin(), eE = mEdgeList.end();
  for(;eB != eE;eB++)
    delete (*eB);
  NodeIterator nB = beginNode(), nE = endNode();
  for(;nB != nE;nB++)
    delete (*nB);
  mEdgeList.clear();
  mNodeList.clear();

  mCriticalNodes.clear();
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

  unsigned topoSortLevel = 0;
  while(anotherList.size() < numNodes)	
  {
    nodeBegin = mNodeList.begin();
    nodeEnd = mNodeList.end();
    tmpList.clear();
    for(; nodeBegin != nodeEnd; nodeBegin++)
    {
      if(allPredsGone(*nodeBegin, search))
      {
	(*nodeBegin)->setTopologicalLevel(topoSortLevel);
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
    ++topoSortLevel;
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

void Graph::addNode(Node* n)
{
  mId2Node[n->getId()] = n;	
  mNodeList.push_back(n);
}

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
  if(getNumNodes() > 25)
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

    //if((*nodeBegin)->getLLVMValue() && (*nodeBegin)->getLLVMValue()->getName())
    //if((*nodeBegin)->getLLVMValue() && ((*nodeBegin)->getLLVMValue()->getName()).length() > 0)
    //{
    //format_stream << (*nodeBegin)->getLLVMValue()->getName();
    //}

    format_stream << (*nodeBegin)->getName();
    //format_stream << "_";
    //format_stream << (*nodeBegin)->getLLVMNodeId();

    format_stream >> src_name;
    format_stream.clear();
    replacedotsWithUnderscore(src_name);

    nodeVector.clear();
    nodeVector = getSuccessors((*nodeBegin));

    for(i=0;i<nodeVector.size();++i)
    {
      string dst_name;
      format_stream << nodeVector[i]->getName();
      //if(nodeVector[i]->getLLVMValue() && (nodeVector[i]->getLLVMValue()->getName()).length()>0)
      //format_stream << nodeVector[i]->getLLVMValue()->getName()<< "_";
      //format_stream << nodeVector[i]->getLLVMNodeId();
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
    name = "node";
  ostringstream namer;
  namer << name << "_" <<getNumNodes();
  name = namer.str();
  namer.clear();
  switch(nodeType)
  {
    case ASIP_NODE_TYPE:
      n = new ASIPNode(this, name, getNumNodes());
      break;
    default:
      n = new Node(this, name, getNumNodes());
      break;
  }
  addNode(n);
  //cerr << "Boost node ? "<<n->getBoostNode()<<endl;
  return n;
}

Node* Graph::createNode(llvm::Value* lVal, unsigned nodeType)
{
  string nodeName = lVal->getName();
  if(nodeName == "")
  {
    llvm::Instruction* inst = llvm::dyn_cast<llvm::Instruction>(lVal);
    if(inst)
      nodeName = inst->getOpcodeName();
    else
      if(llvm::isa<llvm::Constant>(lVal))
	nodeName = "constant";
      else
	if(llvm::isa<llvm::Argument>(lVal))
	  nodeName = "argument";
  }

  if(llvm::isa<llvm::Constant>(lVal))
  {
    Node* n = getNodeIfExists(lVal);
    if(n)
      return n;
  }
  Node* n = createNode(nodeName, nodeType);
  //cerr << "Name "<<n->getName()<<endl;
  //cerr << "Creating node for ";
  //lVal->print(cerr);
  mLLVM2Node[lVal] = n;
  n->setLLVMValue(lVal);
  assert(lVal);
  lVal->setNode(n);
  n->setFunction(llvm::GraphBuilder::getFunction(lVal));
  return n;
}

void Graph::setAllNodeNumDynamicInstances(double val)
{
  for(unsigned i=0;i<mNodeList.size();++i)
    mNodeList[i]->setNumDynamicInstances((unsigned)ceil(val));
}

void Graph::setAllEdgeWeights(double val)
{
  for(unsigned i=0;i<mEdgeList.size();++i)
    mEdgeList[i]->setWeight(val);
}

bool Graph::existsEdge(llvm::Value* pred, llvm::Value* succ)
{
  return !(NOTFOUND(mLLVM2Edge, make_pair(pred,succ)));
}

Edge* Graph::createEdge(llvm::Value* pred, llvm::Value* succ)
{

  //if(NOTFOUND(mLLVM2Node, pred))
  if(getNodeIfExists(pred) == 0)
  {
    cerr << "No node created for pred llvm val : ";
    pred->print(cerr);
    assert(0);
  }
  //if(NOTFOUND(mLLVM2Node, succ))
  if(getNodeIfExists(succ) == 0)
  {
    cerr << "No node created for succ llvm val : ";
    succ->print(cerr);
    assert(0);
  }

  return createEdge(getNode(pred), getNode(succ));
}

Edge* Graph::createEdge(Node* n1, Node* n2)
{
  assert(n1->getParentGraph() == n2->getParentGraph() && n2->getParentGraph() == this);
  if(doesEdgeExist(n1,n2))
    return getEdge(n1,n2);
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

  if(!(llvm::isa<llvm::Constant>(X)))
  {
    if(!(X->getNode() && (X->getNode()->getParentGraph() == this)))
    {
      X->print(cerr);
      assert(X->getNode());
      assert(0);
    }
    return X->getNode();
  }
  else
  {
    assert(!NOTFOUND(mLLVM2Node, X));
    return mLLVM2Node[X];
  }
}

Node* Graph::getNodeIfExists(llvm::Value* X)
{
  //if(NOTFOUND(mLLVM2Node, X))
    //return (Node*)0;
  //else
    //return mLLVM2Node[X];
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

Edge* Graph::getEdge(Node* X, Node* Y)
{
  return X->getSuccessorEdge(Y);
}

Edge* Graph::getEdge(llvm::Value* X, llvm::Value* Y)
{
  return getEdge(X->getNode(), Y->getNode());
  //assert(!NOTFOUND(mLLVM2Edge, make_pair(X,Y)));
  //return mLLVM2Edge[make_pair(X,Y)];
}

bool Graph::doesEdgeExist(Node* X, Node* Y)
{
  return (X->getSuccessorEdgeIfExist(Y) != 0);
}

bool Graph::doesEdgeExist(llvm::Value* X, llvm::Value* Y)
{
  return doesEdgeExist(X->getNode(), Y->getNode());
  //assert(!NOTFOUND(mLLVM2Edge, make_pair(X,Y)));
  //return mLLVM2Edge[make_pair(X,Y)];
}

bool Graph::isBackEdge(Node* X, Node* Y)
{
  return getEdge(X,Y)->isBackEdge();
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
    //if(succVector[i]->getLLVMNodeId() == currNode->getLLVMNodeId())
    //assert(succVector[i] == currNode);
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
  mSCCGraph->topoSort(true);

  mSCCVector.clear();
  vector<Node*> sccNodes = mSCCGraph->getNodes();
  for(unsigned i=0;i<sccNodes.size();++i)
    mSCCVector.push_back(sccNodes[i]->getSCC());
  sccNodes.clear();
}

void Graph::sccBasedToposort(bool reAssignIds)
{
  mNodeList.clear();
  unsigned idx = 0;
  for(unsigned i=0;i<mSCCVector.size();++i)
  {
    SCC* currSCC = mSCCVector[i];
    currSCC->setMinIdx(idx);
    for(unsigned j=0;j<currSCC->size();++j)
    {
      Node* currNode = currSCC->getNode(j);
      if(reAssignIds)
	currNode->setId(idx++);
      mNodeList.push_back(currNode);
      //cerr << "Node "<<currNode->getName()<<endl;
    }
  }
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
      {
	currPath[i]->updateSelfWeight(currPath[i]->getNumDynamicInstances());
#ifdef DEBUG_JOHNSON
	cerr << "Updated self weight to "<<currPath[i]->getSelfWeight()<<endl;
#endif
      }
      else
	currPath[i]->updateSelfWeight(minVal((double)1/(1-weight), 
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
#ifdef DEBUG_JOHNSON
  cerr << "Circuit for : ";
  s->getLLVMValue()->print(cerr);
  cerr << "Curr node "<<s->getName()<< " Path weight "<<weight<<endl;
#endif
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
	    cerr << "Root "<<currNode->getName()<<" instances "<<currNode->getNumDynamicInstances()<<" weight "<<currNode->getSelfWeight()<<"\n";
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
#ifdef DEBUG_JOHNSON
	cerr << "\nRoot node for Johnson "<<s->getName()<<endl;
#endif
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


void Graph::buildBoostGraph()
{
  for(unsigned i=0;i<mNodeList.size();++i)
    boost::add_vertex(mBoostGraph);
  for(unsigned i=0;i<mEdgeList.size();++i)
    boost::add_edge(mEdgeList[i]->getPred()->getId(), mEdgeList[i]->getSucc()->getId(), mBoostGraph);
}

void Graph::buildDominatorTree()
{
  cerr << "Building dominator tree\n";
  //assume DAG and topologically sorted
  topoSort(true);
  cerr << "Completed toposort\n";
  NodeIterator nB, nE;

  nB = beginNode();
  nE = endNode();
  for(;nB != nE;nB++)
  {
    Node* currNode = (*nB);
    currNode->clearDominatorInfo();
  }

  nB = beginNode();
  nE = endNode();
  for(;nB != nE;nB++)
  {
    Node* currNode = (*nB);
    vector<Node*> predNodes = currNode->getPredecessors();
    
    set<Node*> domSet;
    set<Node*> selfSet;
    selfSet.clear();
    domSet.clear();

    selfSet.insert(*nB);
    unsigned i=0;
    for(i=0;i<predNodes.size();++i)
      if(!(currNode->getPredecessorEdge(i)->isBackEdge()))	//ignore back edges
      {
	domSet = predNodes[i]->getDominatorSet();
	break;
      }
    for(;i<predNodes.size();++i)
      if(!currNode->getPredecessorEdge(i)->isBackEdge())
	domSet = llvm::UtilityFunctions::setIntersect(domSet, predNodes[i]->getDominatorSet());
    domSet = llvm::UtilityFunctions::setUnion(selfSet, domSet);
    currNode->setDominatorSet(domSet);
    
    domSet.clear();
    selfSet.clear();
    predNodes.clear();
  }

  for(unsigned i=0;i<mNodeList.size();++i)
  {
    Node* currNode = mNodeList[i];
    set<Node*> domSet;
    set<Node*> domFrontier;
    domSet.clear();
    domFrontier.clear();

    domSet = currNode->getDominanceSet();
    set<Node*>::iterator sB = domSet.begin(), sE = domSet.end();
    
    //cerr << "Node "<<currNode->getName()<<" dominates :";
    //for(set<Node*>::iterator sB = domSet.begin(), sE = domSet.end();sB != sE;sB++)
      //cerr << " "<<(*sB)->getName();
    //cerr << "\n";

    for(;sB != sE;sB++)
    {
      vector<Node*> succNodes = (*sB)->getSuccessors();
      for(unsigned j=0;j<succNodes.size();++j)
	if(!getEdge((*sB), succNodes[j])->isBackEdge() && //ignore back edges
	    NOTFOUND(domSet, succNodes[j]) && NOTFOUND(domFrontier, succNodes[j]))
	  domFrontier.insert(succNodes[j]);
      succNodes.clear();
    }
    currNode->setDominanceFrontier(domFrontier);

    //cerr << "Node "<<currNode->getName()<<" dominance frontier :";
    //for(set<Node*>::iterator sB = domFrontier.begin(), sE = domFrontier.end();sB != sE;sB++)
      //cerr << " "<<(*sB)->getName();
    //cerr << "\n";

    domSet.clear();
    domFrontier.clear();
  }

#ifdef REALLY_BUILD_DOMINATOR_TREE
  mNodeList[0]->setImmDom(0);
  for(unsigned i=0;i<mNodeList.size();++i)
  {
    Node* currNode = mNodeList[i];
    set<Node*> domSet = currNode->getDominanceSet();
    for(set<Node*>::iterator sB = domSet.begin(), sE = domSet.end();sB != sE;sB++)
    {
      if((*sB) == currNode)
	continue;
      Node* domNode = (*sB);
      bool isImmDom = true;
      for(set<Node*>::iterator iB = domSet.begin(), iE = domSet.end();iB != iE;iB++)
      {
	if((*iB) == domNode || (*iB) == currNode)
	  continue;
	set<Node*> otherDomSet = (*iB)->getDominanceSet();
	if(!NOTFOUND(otherDomSet, domNode))
	{
	  isImmDom = false;
	  break;
	}
      }
      if(isImmDom)
	domNode->setImmDom(currNode);
    }
  }
  for(unsigned i=0;i<mNodeList.size();++i)
  {
    vector<Node*> domList;
    domList.clear();
    Node* currNode = mNodeList[i];
    while(currNode != 0)
    {
      domList.push_back(currNode);
      currNode = currNode->getImmDom();
    }
    mNodeList[i]->setDominatorsVec(domList);
    domList.clear();
  }
#endif
}

void Graph::buildNearestDominatorMatrix(vector<vector<Node*> >& matrix)
{
  //should be topologically sorted and should be a DAG
  assert(!testForCycles());
  topoSort(true);

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

void Graph::initPropagate()
{
  for(unsigned i=0;i<mNodeList.size();++i)
  {
    mNodeList[i]->initExternPropagatedValuesVector(getExternallyVisibleNodeVectorSize());
    mNodeList[i]->initInternalPropagatedValuesVector(getNumNodes());
    mNodeList[i]->initOutputPropagatedValuesVector(llvm::GraphBuilder::getOutputNodes().size());
  }
}

void Graph::propagate(vector<Node*> externVisibleNodes, bool skipJohnson)
{
  createSCCGraph();
  sccBasedToposort(true);
  if(!skipJohnson)
    Johnson_Elementary_Cycles();
  
  initPropagate();
  vector<Node*> sccNodes = mSCCGraph->getNodes();

  
  cerr << "Num SCCs "<<sccNodes.size()<<endl;
  //Reverse topological order 
  for(int i=((int)sccNodes.size())-1;i>=0;--i)
  {
#ifdef DEBUG_PROPAGATE
    cerr << "Propagating in new SCC\n";
#endif
    Node* currSCCNode = sccNodes[i];
    SCC* currSCC = currSCCNode->getSCC();

#ifdef DEBUG_PROPAGATE
    cerr << "Within SCC\n";
#endif
    //intra SCC updates - first
    for(unsigned j=0;j<currSCC->size();++j)
    {
      Node* currNode = currSCC->getNode(j);
      for(unsigned k=0;k<currSCC->size();++k)
      {
	Node* nextNode = currSCC->getNode(k);
	double propValue = maxVal(currNode->getInternalPropagatedValue(nextNode->getId()), 
	    nextNode->getSelfWeight());
	propValue = minVal(propValue, nextNode->getNumDynamicInstances());
	currNode->setInternalPropagatedValue(nextNode->getId(), propValue);
#ifdef DEBUG_PROPAGATE
	cerr << currNode->getName() << " -> " << nextNode->getName()<<" "<<propValue<<endl;
#endif
      }
    }

    resetPropertyAllNodes(SCC_SUCC_NODES_ADDED, 0);
    vector<Node*> sccAllSuccNodes;
    //set<Node*> sccAllSuccNodeSet;
    sccAllSuccNodes.clear();
    //sccAllSuccNodeSet.clear();

#ifdef DEBUG_PROPAGATE
    cerr << "Inter SCC immediate predecessors\n";
#endif
    //inter-SCC immediate successor updates 
    for(unsigned j=0;j<currSCC->size();++j)
    {
      Node* currNode = currSCC->getNode(j);
      for(unsigned k=0;k<currSCC->size();++k)
      {
	Node* intermediateNode = currSCC->getNode(k);
	vector<Node*> succNodes = intermediateNode->getSuccessors();
	for(unsigned l=0;l<succNodes.size();++l)
	{
	  Node* succNode = succNodes[l];
	  if(succNode->getSCC() != currSCC)
	  {
	    double propValue = maxVal(intermediateNode->getInternalPropagatedValue(succNode->getId()),
		currNode->getInternalPropagatedValue(succNode->getId()));
	    propValue = minVal(propValue, succNode->getNumDynamicInstances());
	    currNode->setInternalPropagatedValue(succNode->getId(), propValue);
#ifdef DEBUG_PROPAGATE
	    cerr << currNode->getName() << " -> " << succNode->getName()<<" "<<propValue<<endl;
#endif

	    //if(NOTFOUND(sccAllSuccNodeSet, succNode))
	    if(succNode->getProperty(SCC_SUCC_NODES_ADDED) == 0)
	    {
	      sccAllSuccNodes.push_back(succNode);
	      succNode->setProperty(SCC_SUCC_NODES_ADDED, 1);
	      //sccAllSuccNodeSet.insert(succNode);
	    }
	  }
	}
	succNodes.clear();
      }
    }

#ifdef DEBUG_PROPAGATE
    cerr << "Immediate to downstream\n";
#endif
    //From imm successors of SCC to the whole downstream graph
    for(unsigned j=0;j<currSCC->size();++j)
    {
      Node* currNode = currSCC->getNode(j);
      for(unsigned k=0;k<sccAllSuccNodes.size();++k)
      {
	Node* intermediateNode = sccAllSuccNodes[k];
	for(unsigned l=intermediateNode->getSCC()->getMinIdx();l<getNumNodes();++l)
	{
	  Node* succNode = getNode(l);
	  if(succNode != intermediateNode) //already computed for intermediate node
	  {
	    double propValue = maxVal(currNode->getInternalPropagatedValue(intermediateNode->getId())*
		intermediateNode->getInternalPropagatedValue(succNode->getId()),
		currNode->getInternalPropagatedValue(succNode->getId()));
	    propValue = minVal(propValue, succNode->getNumDynamicInstances());
	    currNode->setInternalPropagatedValue(succNode->getId(), propValue);
#ifdef DEBUG_PROPAGATE
	    cerr << currNode->getName() << " -> " << succNode->getName()<<" "<<propValue<<endl;
#endif
	  }
	}
      }
    }
    sccAllSuccNodes.clear();
    //sccAllSuccNodeSet.clear();
  }

  ofstream fptr;
  fptr.open("graphs/propagate.txt",ios::out);
  assert(fptr.is_open());
  for(unsigned i=0;i<getNumNodes();++i)
  {
    Node* currNode = getNode(i);
    for(unsigned k=0;k<getNumNodes();++k)
    {
      Node* targetNode = getNode(k);
      double propValue = currNode->getInternalPropagatedValue(k);
      if(targetNode->isOutputNode())
	currNode->setOutputPropagatedValue(targetNode->getOutputNodeIdx(), 
	    max(currNode->getOutputPropagatedValue(targetNode->getOutputNodeIdx()), propValue));
      if(propValue > 0.01)
	fptr << currNode->getName() << " -> "<<targetNode->getName()<< " : " << propValue << endl;
    }
  }
  fptr.close();
  
  for(unsigned i=0;i<getNumNodes();++i)
  {
    Node* currNode = getNode(i);
    for(unsigned k=0;k<externVisibleNodes.size();++k)
    {
      Node* targetNode = externVisibleNodes[k];
      currNode->setExternPropagatedValue(k, currNode->getInternalPropagatedValue(targetNode->getId()));
    }
  }

  sccNodes.clear();
  mHasBeenPropagated = true;
}

void Graph::markDFGCritical()
{
  vector<Node*> externVisibleNodes = getExternallyVisibleNodes();
  mCriticalNodes.clear();
  vector<Node*> outputNodes = llvm::GraphBuilder::getOutputNodes();
  //mark all Nmin-affecters of output
  for(unsigned i=0;i<outputNodes.size();++i)
  {
    Node* currOutputNode = outputNodes[i];
    for(unsigned k=0;k<getNumNodes();++k)
    {
      Node* currNode = mNodeList[k];
      if(currOutputNode->getParentGraph() == this)
	currNode->setOutputPropagatedValue(i, 
	    max(currNode->getInternalPropagatedValue(currOutputNode->getId()), currNode->getOutputPropagatedValue(i)));
      else
	for(unsigned j=0;j<externVisibleNodes.size();++j)
	{
	  Node* currExtNode = externVisibleNodes[j];
	  currNode->setOutputPropagatedValue(i, 
	      max(currNode->getExternPropagatedValue(j)*currExtNode->getOutputPropagatedValue(i),
		currNode->getOutputPropagatedValue(i))
		);
	 
	}
      if( currOutputNode->getNumDynamicInstances() > 25 && (double)currNode->getOutputPropagatedValue(i) > 
	  currOutputNode->getOutputToleranceThreshold()*((double)currOutputNode->getNumDynamicInstances()))
      {
	//cerr << "Node "<<currNode->getName()<< " Nmin because "<<currNode->getOutputPropagatedValue(i)<< 
	//" for outnode with instances "<<currOutputNode->getNumDynamicInstances()*currOutputNode->getOutputToleranceThreshold();
	//currOutputNode->getLLVMValue()->print(cerr);
	currNode->markCritical();
      }
    }
  }
  externVisibleNodes.clear();
  //unsigned newCriticalBlocks = 0;
  //markAll1Affecters(newCriticalBlocks);
}

unsigned Graph::markAll1Affecters(unsigned& newCriticalBlocks)
{
  //find all 1-affecters of critical nodes by traversing graph in reverse SCC 
  //topological order
  vector<Node*> sccNodes = mSCCGraph->getNodes();
  unsigned numNewCriticalNodesFound = 0;
  newCriticalBlocks = 0;
  //Reverse topological order 
  for(int i=((int)sccNodes.size())-1;i>=0;--i)
  {
    Node* currSCCNode = sccNodes[i];
    SCC* currSCC = currSCCNode->getSCC();
    for(unsigned j=0;j<currSCC->size();++j)
    {
      Node* currNode = currSCC->getNode(j);
      if(!currNode->isCritical())
      {
	for(unsigned k=0;k<mCriticalNodes.size();++k)
	  if(currNode->getInternalPropagatedValue(mCriticalNodes[k]->getId()) > 0)
	  {
	    ++numNewCriticalNodesFound;
	    currNode->markCritical();
	    break;
	  }
      }
    }
  }
  return numNewCriticalNodesFound;
}

void Graph::addExternallyVisibleNode(Node* X)
{
  if(NOTFOUND(mExternallyVisibleNodeSet, X))
  {
    mExternallyVisibleNodeSet.insert(X);
    mExternallyVisibleNodes.push_back(X);
    X->setExternallyVisibleIdx(mExternallyVisibleNodes.size()-1);
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
    for(unsigned j=0;j<getExternallyVisibleNodeVectorSize();++j)
    {
      if(i != j)
      {
	Node* dstNode = getExternallyVisibleNode(j);
	assert(dstNode->getFunction() == getFunction());
	Node* newDstNode = getCalleeExternallyVisibleNode(j);
	assert(newDstNode->getParentGraph() == mExternallyVisibleSubgraph);
	if(srcNode->getExternPropagatedValue(j) > 0)
	{
	  Edge* e = mExternallyVisibleSubgraph->createEdge(newSrcNode, newDstNode);
	  //cerr << "Created edge in externally visible sub-graph\n";
	  //because we always multiply the self weight by edge weight in propagate
	  //e->setEdgeWeight(srcNode->getExternPropagatedValue(j)/srcNode->getSelfWeight());
	  e->setEdgeWeight(srcNode->getExternPropagatedValue(j));
	}
	if(dstNode->getExternPropagatedValue(i) > 0)
	{
	  Edge* e = mExternallyVisibleSubgraph->createEdge(newDstNode, newSrcNode);
	  //e->setEdgeWeight(dstNode->getExternPropagatedValue(i)/dstNode->getSelfWeight());
	  e->setEdgeWeight(dstNode->getExternPropagatedValue(i));
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


//CFG related functions
void Graph::findSuccBlocksBeforeImmPostDom(llvm::Function* F, llvm::PostDominatorTree* postDomTree)
{
  unsigned i = 0;
  llvm::Function::iterator I = F->begin();
  llvm::Function::iterator E = F->end();

  for (; I != E; ++I) 
  {
    llvm::BasicBlock* currentBlk = &(*I);
    llvm::DomTreeNode* tNode = (*postDomTree)[currentBlk];
    if(tNode == 0)
    {
      cerr << "WARNING: No dom tree node for "<<currentBlk->getName()<<"\n";
      //gWarningFptr << "WARNING: No dom tree node for "<<currentBlk->getName()<<"\n";
      continue;
    }
    assert(tNode);
    llvm::DomTreeNode* iDomNode = tNode->getIDom();
    llvm::BasicBlock* iDomBlk = 0;
    if(iDomNode)
      iDomBlk = iDomNode->getBlock();

    set<llvm::BasicBlock*> nextSet, totalSet;	

    nextSet.clear();
    totalSet.clear();
    nextSet.insert(currentBlk);
    if(iDomBlk)
      totalSet.insert(iDomBlk);

    while(!nextSet.empty())
    {
      llvm::BasicBlock* tmpBlk = *(nextSet.begin());
      assert(tmpBlk);
      nextSet.erase(nextSet.begin());
      totalSet.insert(tmpBlk);

      llvm::TerminatorInst* termI = tmpBlk->getTerminator();
      for(i=0;i<termI->getNumSuccessors();++i)
      {
	llvm::BasicBlock* succBlk = termI->getSuccessor(i);
	assert(succBlk);
	if(NOTFOUND(totalSet, succBlk) && NOTFOUND(nextSet, succBlk))
	  nextSet.insert(succBlk);
      }
    }

    if(!NOTFOUND(totalSet, currentBlk))
      totalSet.erase(totalSet.find(currentBlk));
    if(iDomBlk && !NOTFOUND(totalSet, iDomBlk))
      totalSet.erase(totalSet.find(iDomBlk));
    Node* currNode = getNode(currentBlk);
    for(set<llvm::BasicBlock*>::iterator sB = totalSet.begin(),sE = totalSet.end();
	sB != sE;sB++)
    {
      Node* X = getNode(*sB);
      currNode->addBlockBeforePostDom(X);
    }
    totalSet.clear();
    nextSet.clear();
  }
}

unsigned Graph::addCriticalLoopExitBlocks(set<llvm::Loop*>& criticalLoops, llvm::BasicBlock* blk, 
    llvm::LoopDataStructure* loopInfo)
{
  vector<llvm::Loop*> parentLoops =  loopInfo->getLoopsForBlock(blk);
  if(parentLoops.size() == 0)
    return 0;
  unsigned numNewBlocksFound = 0;
  for(int i= ((int)parentLoops.size())-1;i>=0;--i)
  {
    if(!NOTFOUND(criticalLoops, parentLoops[i]))
      return numNewBlocksFound;
    //cerr << "Found new critical loop\n";
    criticalLoops.insert(parentLoops[i]);
    vector<llvm::BasicBlock*> exitBlocks;
    exitBlocks.clear();
    loopInfo->getExitBlocks(parentLoops[i],exitBlocks);
    for(unsigned j=0;j<exitBlocks.size();++j)
    {
      getDFG()->getNode(exitBlocks[j]->getTerminator())->markCritical();
      //cerr << "marked loop exit terminator as critical\n";
      numNewBlocksFound++;
    }
    exitBlocks.clear();
  }
  parentLoops.clear();
  return numNewBlocksFound;
}


void Graph::handleBlocksBeforePostDom()
{
  vector<Node*> outputNodes = llvm::GraphBuilder::getOutputNodes();
  for(unsigned i=0;i<getNumNodes();++i)
    if(!mNodeList[i]->isCritical())
    {
      vector<Node*> nodeVec = mNodeList[i]->getBlocksBeforePostDom();
      bool isCritical = false;
      for(unsigned j=0;j<nodeVec.size() && !isCritical;++j)
      {
	double relNumber = mNodeList[i]->getNumDynamicInstances() == 0 ? 0 :
	  ((double)nodeVec[j]->getNumDynamicInstances())/mNodeList[i]->getNumDynamicInstances();
	vector<Node*> instVec = nodeVec[j]->getInstructionNodes();
	for(unsigned k=0;k<instVec.size() && !isCritical;++k)
	{
	  for(unsigned l=0;l<outputNodes.size();++l)
	    if(relNumber*instVec[k]->getOutputPropagatedValue(l) >= 
		outputNodes[l]->getOutputToleranceThreshold()*outputNodes[l]->getNumDynamicInstances())
	    {
	      isCritical = true;
	      break;
	    } 
	}
	instVec.clear();
      }
      if(isCritical)
      {
	llvm::BasicBlock* currBlk = mNodeList[i]->getBasicBlock();
	getDFG()->getNode(currBlk->getTerminator())->markCritical();
      }
      nodeVec.clear();
    }
  outputNodes.clear();
}

bool Graph::reachesCriticalBeforePostDom(Node* X)
{
  vector<Node*> nodeVec = X->getBlocksBeforePostDom();
  bool returnVal = false;
  for(unsigned i=0;i<nodeVec.size();++i)
    if(nodeVec[i]->isCritical())
    {
      returnVal =  true;
      break;
    }
  nodeVec.clear();
  return returnVal;
}

void Graph::markCriticalBlocks()
{
  assert(mLoopDataStructure);
  llvm::LoopDataStructure* loopInfo = mLoopDataStructure;

  Graph::mCriticalityTypeMask = CFG_NMIN_BEFORE_POST_DOMINATOR; 
  set<llvm::Loop*> criticalLoops;
  criticalLoops.clear();
  handleBlocksBeforePostDom();
  //cerr << "After blocks before post dom\n";
  //getDFG()->printCriticalNodes();
  Graph::mCriticalityTypeMask = CFG_CRITICAL_LOOP_EXIT; 
  for(unsigned i=0;i<getNumNodes();++i)
    if(mNodeList[i]->isCritical())
    {
      //cerr << "Marking loop critical for block\n";
      addCriticalLoopExitBlocks(criticalLoops, 
	  llvm::dyn_cast<llvm::BasicBlock>(mNodeList[i]->getLLVMValue()), loopInfo);
    }
  unsigned numNewCriticalBlocks = 0;
  getDFG()->markAll1Affecters(numNewCriticalBlocks);
 
  set<Node*> remainingBlocks;
  remainingBlocks.clear();
  for(unsigned i=0;i<getNumNodes();++i)
  {
    if(!(getNode(i)->isCritical()))
      remainingBlocks.insert(mNodeList[i]);
  }
  bool foundNewCriticalBlocks = false;
  set<Node*>::iterator bBegin, bEnd, tmpIter;
  do	
  {
    foundNewCriticalBlocks = false;
    bBegin = remainingBlocks.begin();
    bEnd = remainingBlocks.end();
    for(;bBegin != bEnd;)
    {
      Node* currNode = (*bBegin);
      llvm::BasicBlock* tmpBlk = llvm::dyn_cast<llvm::BasicBlock>(currNode->getLLVMValue());
      llvm::Instruction* termInst = tmpBlk->getTerminator();
      //Implies that control flow from this block is important
      if(!(getDFG()->getNode(termInst)->isCritical()) && reachesCriticalBeforePostDom(currNode))
      {
	//If not already critical, mark as critical
	if(!(currNode->isCritical()))
	{
	  foundNewCriticalBlocks = true;
	  currNode->markCritical();
	  Graph::mCriticalityTypeMask = CFG_CRITICAL_LOOP_EXIT2; 
	  addCriticalLoopExitBlocks(criticalLoops, tmpBlk, loopInfo); 
	}

	Graph::mCriticalityTypeMask = CFG_CRIT_BEFORE_POST_DOMINATOR; 
	getDFG()->getNode(termInst)->markCritical();

	unsigned numCritNodes = mCriticalNodes.size();
	getDFG()->markAll1Affecters(numNewCriticalBlocks);
	//gOutputFptr << "Block "<<tmpBlk->getName()<<" reaches critical block before post dom\n";
	//cerr << "Block "<<tmpBlk->getName()<<" reaches critical block before post dom\n";
	//gOutputFptr << "Branch found critical : size "<<mDepSet.size()<<" : ";
	//termInst->print(gOutputFptr);
	//
	Graph::mCriticalityTypeMask = CFG_CRITICAL_LOOP_EXIT2; 
	for(unsigned i=numCritNodes;i<mCriticalNodes.size();++i)
	  addCriticalLoopExitBlocks(criticalLoops,
	      llvm::dyn_cast<llvm::BasicBlock>(mCriticalNodes[i]->getLLVMValue()),
	      loopInfo
	      );
	//Can delete this block because we know it already reaches a critical block
	//in some control path before imm post-dominator
	tmpIter = bBegin;
	bBegin++;
	remainingBlocks.erase(tmpIter);
      }
      else
	bBegin++;
    }
  }while(foundNewCriticalBlocks);
  remainingBlocks.clear();
  criticalLoops.clear();
}


//FOR ASIP
void Graph::enumerateAllPaths()
{
  topoSort(true);
  //initialization
  for(unsigned i=0;i<mNodeList.size();++i)
    mNodeList[i]->setNumPathsToExit(1);
  //reverse topological order
  for(int i=((int)(mNodeList.size()))-1;i>=0; --i)
  {
    unsigned numPaths = 0;
    vector<Node*> succNodes = mNodeList[i]->getSuccessors();
    for(unsigned j=0;j<succNodes.size();++j)
      numPaths += succNodes[j]->getNumPathsToExit();
    if(succNodes.size() == 0)
      numPaths = 1;
    mNodeList[i]->setNumPathsToExit(numPaths); 
  }
}

void Graph::getAllPaths(vector<vector<Node*> >& nodePathsVector, Node* rootNode)
{
  vector<vector<Node*> > myNodePathsVector;
  for(unsigned i=0;i<myNodePathsVector.size();++i)
    myNodePathsVector[i].clear();
  myNodePathsVector.clear();
  vector<Node*> succNodes = rootNode->getSuccessors();
  if(succNodes.size() == 0)
  {
    vector<Node*> currPath;
    currPath.clear();
    currPath.push_back(rootNode);
    nodePathsVector.push_back(currPath);
  }
  else
  {
    for(unsigned i=0;i<succNodes.size();++i)
      getAllPaths(myNodePathsVector, succNodes[i]);
    for(unsigned i=0;i<myNodePathsVector.size();++i)
    {
      vector<Node*> currPath;
      currPath.push_back(rootNode);
      for(unsigned j=0;j<myNodePathsVector[i].size();++j)
	currPath.push_back(myNodePathsVector[i][j]);
      nodePathsVector.push_back(currPath);
    }
  }
  for(unsigned i=0;i<myNodePathsVector.size();++i)
    myNodePathsVector[i].clear();
  myNodePathsVector.clear();
}

bool Graph::shouldBuildEdge(llvm::Value* X)
{
  //if(isa<ConstantFP>(X) || isa<ConstantInt>(X))
  if(llvm::UtilityFunctions::isSimpleConstant(X))
    return false;
  //if(isa<Constant>(X) && !isa<ConstantExpr>(X) && !isa<GlobalVariable>(X))	//don't bother with constants
  //return false;
  if(!(getNodeIfExists(X)))
    createNode(X);
  return true;
}


void Graph::resetPropertyAllNodes(unsigned idx, unsigned val)
{
  for(unsigned i=0;i<mNodeList.size();++i)
    mNodeList[i]->resetProperty(idx,val);
}

void Graph::printCriticalNodes()
{
  cerr << "Function : "<<mFunction->getName()<< " critical nodes : "<<(double)mCriticalNodes.size()/mNodeList.size()<<"\n";
  sort(mCriticalNodes.begin(), mCriticalNodes.end(), Node::LLVMNodeIdCompare);
  unsigned numDynCrit = 0;
  for(unsigned i=0;i<mCriticalNodes.size();++i)
  {
    assert(mCriticalNodes[i]->getLLVMValue());  
    bitset<NUM_CRITICALITY_TYPES> X(mCriticalNodes[i]->getCriticalityTypeMask());
    cerr << "Criticality mask "<<X<< "\t";
    mCriticalNodes[i]->getLLVMValue()->print(cerr);
    if(mCriticalNodes[i]->getInstruction() == 0)
      cerr << endl;
    numDynCrit += mCriticalNodes[i]->getNumDynamicInstances();
  }
  unsigned numTotal = 0;
  for(unsigned i=0;i<mNodeList.size();++i)
    numTotal += mNodeList[i]->getNumDynamicInstances();
  cerr << "Function : "<<mFunction->getName()<< " critical % : "<<(double)numDynCrit/numTotal<<"\n";
}
