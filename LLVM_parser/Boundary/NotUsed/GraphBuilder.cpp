//===- Hello.cpp - Example code from "Writing an LLVM Pass" ---------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements two versions of the LLVM "Hello World" pass described
// in docs/WritingAnLLVMPass.html
//
//===----------------------------------------------------------------------===//

#include "GraphBuilder.h"
#include "UtilityFunctions.h"
#include "UtilityFunctions2.h"
#include "LoopDataStructure.h"
#include "DriverGraphPass.h"
//#include "CommonDataStructure.h"

using namespace llvm;

#define CALLEE_STORES_IDX 0
#define CALLEE_LOADS_IDX 1
#define CALLEE_ARGS_IDX 2
//char GraphBuilder::ID = 123;
//static RegisterPass<GraphBuilder> X("graph-builder", "GraphBuilder Pass");

//#define CREATE_EDGE(X, Y) (isa<Instruction>(X) : mGraph->createEdge(X, Y) : 0 )

namespace llvm
{
    vector<Node*> GraphBuilder::mOutputNodesVec;
    Function* GraphBuilder::getFunction(Value* v)
    {
        if(isa<Constant>(v))
            return 0;
        if(isa<Instruction>(v) && (dyn_cast<Instruction>(v))->getParent())
            return (dyn_cast<Instruction>(v))->getParent()->getParent();
        if(isa<Argument>(v))
            return (dyn_cast<Argument>(v))->getParent();
        if(isa<BasicBlock>(v))
            return (dyn_cast<BasicBlock>(v))->getParent();
        //assert(0);
        return 0;
    }

    BasicBlock* GraphBuilder::getBasicBlock(Node* X)
    {
        Instruction* Y = dyn_cast<Instruction>(X->getLLVMValue());
        assert(Y);
        return Y->getParent();
    }

    void GraphBuilder::clear()
    {
        reset();
        mId2Node.clear();
        mFunction2Graph.clear();
        mFunction2CFG.clear();
        mLLVM2Node.clear();
        mLoadVector.clear();
        mStoreVector.clear();

        map<uint64_t, vector<Function*> >::iterator mB = mCallSite2Functions.begin(), mE = mCallSite2Functions.end();
        for(;mB != mE;mB++)
            (*mB).second.clear();
        mCallSite2Functions.clear();
        mStoreInstId2NodeId.clear();
        mLoadInstId2NodeId.clear();

        for(unsigned i=0;i<mDomMatrix.size();++i)
            mDomMatrix[i].clear();
        mDomMatrix.clear();

        mBlkCounters.clear();
        mName2Function.clear();
        mFunctionVector.clear();

        mOutputNodesVec.clear();
    }

    void GraphBuilder::reset()
    {
        mDuplicatedNodes.clear();
    }	

    bool GraphBuilder::doInitialization(Module& M)
    {
        clear();

        system("mkdir -p graphs");
        system("mkdir -p images");

        //First one is don't care
        mNodeId = 1;
        mBlkId = 1;
        mFunctionId = 1;

        mLoadInstId2NodeId.push_back(0);	//invalid id 0
        mStoreInstId2NodeId.push_back(0);
        mBlkCounters.push_back(0);
        mId2Node.push_back(0);

        for (Module::iterator I = M.begin(), E = M.end(); I != E; ++I)
            mName2Function[(*I).getName()] = &(*I);

        return false;
    }

    bool GraphBuilder::runOnModule(Module& M, DriverGraphPass* driverPass, string dep_edge_filename, string blk_profile_name)
    {
        mDriverPass = driverPass;
        doInitialization(M);	
        //block counts
        blockCounters(blk_profile_name);

        mNodeId = 1;
        mBlkId = 1;
        mFunctionId = 1;

        int i = 0;
        for (Module::iterator I = M.begin(), E = M.end(); I != E; ++I)
        {
            Function& F = (*I);
            cerr << "enter buildCFG!\n";
            if (!(F.isDeclaration()))
                buildCFG(&F, mDriverPass->getLoopInfo(&F), mBlkId);

        }

        mNodeId = 1;
        mBlkId = 1;
        mFunctionId = 1;

        //Call graph
        createCallGraph();		

        //Create all nodes for instructions in the Module
        for (Module::iterator I = M.begin(), E = M.end(); I != E; ++I)
        {
            Function& F = (*I);
            if(!(F.isDeclaration()))
            {
                runOnFunction(F, 0);
                ++mFunctionId;
            }
        }

        cerr << "\n## Annotating edge weights from profiling\n";
        //store->load edges
        annotateEdgeWeights(dep_edge_filename);

        cerr << "Finish annotating Edge Weight!!!\n";


        //Create all nodes for instructions in the Module
        mNodeId = 1;
        mBlkId = 1;
        mFunctionId = 1;
        //only process functions which are called
        vector<Node*> callGraphNodes = mCallGraph->getNodes();
        //for (Module::iterator I = M.begin(), E = M.end(); I != E; ++I)
        //propagate from bottom of call graph
        for(int i=((int)(callGraphNodes.size()));i>=0;--i)	//??? i=size-1 ?
        {
            cerr << "at loop iteration: " << i << endl;
            //Function* F = &(*I);
            Node* currNode = callGraphNodes[i];
            Function* F = dyn_cast<Function>(currNode->getLLVMValue());
            assert(F);
            mFunctionId = currNode->getLLVMNodeId();
            Graph* DFG = mFunction2Graph[F];
            Graph* CFG = mFunction2CFG[F];
            assert(DFG);
            assert(CFG);
            DFG->setCFG(CFG);
            CFG->setDFG(DFG);
            mBlkId = CFG->getNode((unsigned)0)->getLLVMNodeId();
            mNodeId = DFG->getNode((unsigned)0)->getLLVMNodeId();
            if(!(F->isDeclaration()))
                runOnFunction(F, 2);
            //++mFunctionId;
        }

        cerr << "Second run finished!!!\n";

        //find critical nodes from top of call graph
        for(unsigned i=0;i<callGraphNodes.size();++i)
        {
            Function* F = dyn_cast<Function>(callGraphNodes[i]->getLLVMValue());
            assert(!NOTFOUND(mFunction2Graph, F));
            Graph* currGraph = mFunction2Graph[F];
            currGraph->markDFGCritical();
        }
        return false;

        cerr << "Graph Builder ends!!!\n" ;   
    }

    bool GraphBuilder::runOnFunction(Function& F, unsigned passId)
    {
        return runOnFunction(&F, passId);
    }

    void GraphBuilder::buildSimpleAliasEdges(Graph* dfg, Graph* cfg, AliasAnalysis* aliasAnalysisPass, 
            TargetData* targetDataPass)
    {
        vector<Node*> nodeList = dfg->getNodes();
        for(unsigned i=0;i<nodeList.size();++i)
        {
            //cerr << "Looking at node ";
            //nodeList[i]->getLLVMValue()->print(cerr);
            vector<Node*> succNodes = nodeList[i]->getSuccessors();
            Instruction* currInst = dyn_cast<Instruction>(nodeList[i]->getLLVMValue());
            StoreInst* currStoreInst = dyn_cast<StoreInst>(nodeList[i]->getLLVMValue());
            if(currInst)
            {
                BasicBlock* predBlk = currInst->getParent();
                Node* predBlkNode = cfg->getNode(predBlk);

                ////mark back edges for toposort
                //for(unsigned j=0;j<succNodes.size();++j)
                //{
                //Instruction* succInst = dyn_cast<Instruction>(succNodes[j]->getLLVMValue());
                //assert(succInst);
                //if(succInst->getParent() != predBlk)
                //{
                ////Edge* cEdge = cfg->getEdge(predBlk,succInst->getParent());
                ////nodeList[i]->getSuccessorEdge(j)->markBackEdge(cEdge->isBackEdge());
                //}
                //}

                if(isa<CallInst>(currInst) || isa<StoreInst>(currInst))
                {
                    bool sawCurrInst = false;

                    //Instructions within the same block
                    for(BasicBlock::iterator II = predBlk->begin(), IE = predBlk->end(); II != IE; II++)
                    {
                        if(sawCurrInst && (isa<CallInst>(*II) || isa<LoadInst>(*II) || isa<StoreInst>(*II)) 
                                && !(dfg->doesEdgeExist(currInst, &(*II)))) //avoid duplicate edges
                        {
                            if(currStoreInst && isa<LoadInst>(*II))
                            {

                                AliasAnalysis::AliasResult depResult = UtilityFunctions::alias(aliasAnalysisPass, 
                                        targetDataPass, currStoreInst, dyn_cast<LoadInst>(&(*II)));
                                if(depResult == AliasAnalysis::NoAlias)
                                {
                                    //cerr << "Following load store do not alias : \n";
                                    //cerr << "Store ";
                                    //currStoreInst->print(cerr);
                                    //cerr << "Load ";
                                    //(*II).print(cerr);
                                    continue;
                                }
                            }
                            if(!dfg->doesEdgeExist(currInst, &(*II)))
                            {
                                Edge* e = dfg->createEdge(currInst, &(*II));
                                e->setWeight(1);
                                e->markMemopEdge(true);
                            }
                        }
                        if(&(*II) == currInst)
                            sawCurrInst = true;
                    }

                    //Instructions in topologically lower blocks
                    for(unsigned j=0;j<nodeList.size();++j)
                    {
                        Instruction* succInst = nodeList[j]->getInstruction();
                        if(succInst && (isa<CallInst>(succInst) || isa<LoadInst>(succInst) || isa<StoreInst>(succInst)))
                        {
                            BasicBlock* blk = succInst->getParent();
                            Node* blkNode = cfg->getNode(blk);

                            if(blkNode->getTopologicalLevel() > predBlkNode->getTopologicalLevel()
                                    && !(dfg->doesEdgeExist(currInst, succInst)))
                            {
                                bool weakEdgeFlag = true;
                                if(currStoreInst && isa<LoadInst>(succInst))
                                {
                                    AliasAnalysis::AliasResult depResult = UtilityFunctions::alias(aliasAnalysisPass, targetDataPass, currStoreInst, dyn_cast<LoadInst>(succInst));
                                    if(depResult == AliasAnalysis::NoAlias)
                                        continue;
                                    else
                                        if(depResult == AliasAnalysis::MustAlias)
                                            weakEdgeFlag = false;
                                }
                                if(!dfg->doesEdgeExist(nodeList[i], nodeList[j]))
                                {
                                    //since in this case, the instructions are always in different blocks, use phi node technique
                                    //to obtain non-convex control flow and convex data flow in clustering
                                    Edge* e = dfg->createEdge(nodeList[i], nodeList[j]);
                                    e->setWeight(1);
                                    e->markMemopEdge(true);
                                    //e->markWeakEdge(weakEdgeFlag);
                                }

                                //Node* phinode = dfg->createNode("random_phi",NORMAL_NODE_TYPE);
                                //phinode->setDummyPhiNodeFlag(true);
                                //Edge* e1 = dfg->createEdge(nodeList[i], phinode);
                                //e1->setWeight(1);
                                //Edge* e2 = dfg->createEdge(phinode, nodeList[j]);
                                //e2->setWeight(1);
                            }
                        }
                    }
                }
            }
        }
        nodeList.clear();
    }

    bool GraphBuilder::runOnFunction(Function* F, unsigned passId)
    {
        cerr << "\n### Processing function "<<F->getName()<<endl;
        switch(passId)
        {
            case 0:
                reset();
                mGraph = new Graph();
                mGraph->setFunction(F);
                runFirstPass(F);
                mFunction2Graph[F] = mGraph;
                mFunctionVector.push_back(F);
                break;
                //case 1:
                //mGraph = mFunction2Graph[F];
                //runSimpleDepEdgesPass(F);
            case 2:
                assert(!NOTFOUND(mFunction2Graph, F));
                mGraph = mFunction2Graph[F];
                assert(!NOTFOUND(mFunction2CFG, F));
                mCFG = mFunction2CFG[F];
                runSecondPass(F);
                break;
        }

        return false;
    }

    void GraphBuilder::runFirstPass(Function* F, unsigned nodeType)
    {
        //cerr << "Came here\n";
        Function::arg_iterator aB = F->arg_begin();
        Function::arg_iterator aE = F->arg_end();

        if(mBlkCounters.size() < mBlkId)
            mBlkCounters.push_back(0);
        unsigned argNumInstances = 1;	
        if(F->begin() != F->end())
            argNumInstances = mBlkCounters[mBlkId];	//first block of the function

        unsigned argId = 0;
        for(;aB != aE;aB++,++argId)
        {
            Node* argNode = mGraph->createNode(&(*aB), nodeType);
            argNode->setArgId(argId);
            argNode->setNumDynamicInstances(argNumInstances);
            mGraph->addExternallyVisibleNode(argNode);
        }

        Function::iterator I = F->begin();
        Function::iterator E = F->end();

        for (; I != E; ++I)
        {
            if(mBlkCounters.size() < mBlkId)
                mBlkCounters.push_back(0);
            for (BasicBlock::iterator II = I->begin(), IE = I->end();
                    II != IE; ++II)
            {
                Instruction& currentI = (*II);
                Node* currNode = mGraph->createNode(&currentI, nodeType);
                mId2Node.push_back(currNode);

                currNode->setLLVMId(mNodeId);
                currNode->setFunction(F);
                currNode->setNumDynamicInstances(mBlkCounters[mBlkId]);

                if(isa<LoadInst>(currentI) && UtilityFunctions::isPrimitiveType(currentI.getType()))
                    mLoadInstId2NodeId.push_back(mNodeId);
                if(isa<StoreInst>(currentI) && UtilityFunctions::isPrimitiveType
                        (currentI.getOperand(0)->getType()))
                    mStoreInstId2NodeId.push_back(mNodeId);
                ++mNodeId;
            }
            ++mBlkId;
        }
    }

    void GraphBuilder::runSimpleDepEdgesPass(Function* F)
    {
        Function::iterator I = F->begin();
        Function::iterator E = F->end();

        mDepComplexity = SIMPLE_DEP_ANALYSIS;
        I = F->begin();
        E = F->end();
        for (; I != E; ++I)
        {
            for (BasicBlock::iterator II = I->begin(), IE = I->end();
                    II != IE; ++II)
            {
                Instruction& currentI = (*II);
                //cerr << "Building dep edges for ";
                //currentI.print(cerr);
                buildDepEdges(currentI);
                ++mNodeId;
            }
        }
    }

    void GraphBuilder::runSecondPass(Function* F)
    {
        Function::iterator I = F->begin();
        Function::iterator E = F->end();

        mCallSiteId = 0;
        unsigned origNodeId = mNodeId;
        unsigned origBlkId = mBlkId;
        I = F->begin();
        E = F->end();

        mDuplicatedNodes.clear();
        //Add nodes from callee's graphs
        for (; I != E; ++I)
        {
            for (BasicBlock::iterator II = I->begin(), IE = I->end();
                    II != IE; ++II)
            {
                Instruction& currentI = (*II);
                if(isa<CallInst>(currentI))
                {
                    uint64_t key = (((uint64_t)mFunctionId) << 32) | ((uint64_t)mCallSiteId);
                    //cerr << "For call inst key "<<hex<<key<<dec<<endl;
                    if(!NOTFOUND(mCallSite2Functions, key))
                    {
                        vector<Function*> calledFunctions = mCallSite2Functions[key];
                        assert(calledFunctions.size() >= 1);
                        for(unsigned j=0;j<calledFunctions.size();++j)
                        {
                            assert(calledFunctions[j]);
                            Function* callee = calledFunctions[j];
                            if(!callee->isDeclaration() && 
                                    mId2Node[mNodeId]->getNumDynamicInstances() > 0)
                            {
                                assert(!NOTFOUND(mFunction2Graph, callee));
                                assert(mFunction2Graph[callee]);
                                assert(mFunction2Graph[callee]->hasBeenPropagated());
                                Graph* calleeGraph = mFunction2Graph[callee]->getExternallyVisibleSubGraph();
                                assert(calleeGraph);
                                addCalleeNodes(mGraph, calleeGraph, callee, mId2Node[mNodeId], 
                                        mCallSiteId);
                            }
                        }
                        calledFunctions.clear();
                    }
                    else
                        cerr << "Not analyzing call site\n";
                    ++mCallSiteId;
                }
                ++mNodeId;
            }
            ++mBlkId;
        }

        mDepComplexity = PROPAGATE_DEP_ANALYSIS;
        mCallSiteId = 0;
        mNodeId = origNodeId;
        mBlkId = origBlkId;
        I = F->begin();
        E = F->end();
        for (; I != E; ++I)
        {
            for (BasicBlock::iterator II = I->begin(), IE = I->end();
                    II != IE; ++II)
            {
                Instruction& currentI = (*II);
                if(mBlkCounters[mBlkId] > 0)
                    buildDepEdges(currentI);
                if(isa<CallInst>(currentI))
                    ++mCallSiteId;
                ++mNodeId;
            }
            ++mBlkId;
        }

        //mNodeId = origNodeId;

        //vector<Node*> nodeVec = mGraph->getNodes();
        //cerr << "Num nodes in function "<<F->getName()<< " " <<nodeVec.size()<<endl;
        //for(unsigned i=0;i<nodeVec.size();++i)
        //{
        //nodeVec[i]->initExternPropagatedValuesVector(mGraph->getExternallyVisibleNodeVectorSize());
        //nodeVec[i]->initInternalPropagatedValuesVector(mGraph->getNumNodes());
        //nodeVec[i]->initOutputPropagatedValuesVector(GraphBuilder::getOutputNodes().size());
        //}
        //nodeVec.clear();

        //mGraph->identifySCCs();
        //cerr << "\nStarting Johnson's cycle enumeration technique\n";	
        //mGraph->Johnson_Elementary_Cycles();

        //Call propagate here
        //

        mGraph->propagate(mGraph->getExternallyVisibleNodes());

        mGraph->createExternallyVisibleSubGraph();		

        //dump dot files
        mGraph->getExternallyVisibleSubGraph()->dumpDot("extern_"+F->getName());
        //string command = "dot -Tpng graphs/extern_"+F->getName()+".dot > images/extern_"+F->getName()+".png";
        //system(command.c_str());

        mGraph->dumpDot("pdg_"+F->getName());
        //command = "dot -Tpng "+filePrefix+".dot > images/pdg_"+F->getName()+".png";
        //system(command.c_str());

        //cleanup
        set<Node*>::iterator sB = mDuplicatedNodes.begin(), sE = mDuplicatedNodes.end();
        for(;sB != sE;sB++)
            (*sB)->clearCalleeDuplicateNodes();
    }

    bool GraphBuilder::runCallGraphConstruction(Module& M)
    {
        doInitialization(M);
        mNodeId = 1;
        mBlkId = 1;
        createCallGraph();		
        return false;
    }

    void GraphBuilder::addCalleeNodes(Graph* currGraph, Graph* calleeGraph, Function* calleeFunction, 
            Node* calleeNode, unsigned callSiteId)
    {
        calleeNode->addCalledFunction(calleeFunction);
        calleeNode->addCalleeGraph(calleeGraph);
        vector<Node*> vec = calleeGraph->getNodes();
        cerr << "Adding callee nodes for "<<calleeFunction->getName()<<" num nodes "<<vec.size()<<endl;
        for(unsigned j=0;j<vec.size();++j)
        {
            Node* currNode = vec[j];
            Node* origNode = currNode->getOriginalNode();

            Node* newNode = currGraph->createNode();
            newNode->copyLLVMData(currNode);

            newNode->setCallSiteId((int)callSiteId);
            //newNode->setFunction(calleeFunction);
            newNode->setFunction(currGraph->getFunction());
            newNode->setCalleeNode(calleeNode);
            newNode->setCalledFunction(calleeFunction);

            origNode->addCalleeDuplicateNode(newNode, mCallSiteId);
            currNode->addCalleeDuplicateNode(newNode, mCallSiteId);

            //Only for memory freeing at the end
            if(NOTFOUND(mDuplicatedNodes, origNode))
                mDuplicatedNodes.insert(origNode);
            if(NOTFOUND(mDuplicatedNodes, currNode))
                mDuplicatedNodes.insert(currNode);

            //don't bother with args or return instructions
            Value* llvmVal = currNode->getLLVMValue();
            if(isa<LoadInst>(llvmVal) || isa<StoreInst>(llvmVal))
            {
                //cerr << "#Num times "<<j<<endl;
                if(isExternallyVisible(currNode, currGraph->getFunction()))
                {
                    currGraph->addExternallyVisibleNode(newNode);
                    //cerr << "Num times "<<j<<endl;
                }
            }
        }
        vec.clear();

        vector<Edge*> edgeVec = calleeGraph->getEdges();
        for(unsigned i=0;i<edgeVec.size();++i)
        {
            Edge* currEdge = edgeVec[i];
            Node* pred = currEdge->getPred();
            Node* succ = currEdge->getSucc();
            Edge* newEdge = currGraph->createEdge(pred->getCalleeDuplicateNode(mCallSiteId), 
                    succ->getCalleeDuplicateNode(mCallSiteId));
            newEdge->copyData(currEdge);
        }
        edgeVec.clear();
    }


    void GraphBuilder::visitCallInst(CallInst& I)
    {
        Node* callNode = mId2Node[mNodeId];
        //cerr << "num operands for call inst "<<I.getNumOperands()<<endl;
        if(mDepComplexity  == SIMPLE_DEP_ANALYSIS)
            for(unsigned i=0;i<I.getNumOperands()-1;++i)
                CREATE_EDGE(I.getOperand(i+1), &I);	//first operand is the function

        //return;
        if(mDepComplexity == PROPAGATE_DEP_ANALYSIS)
        {
            vector<Graph*> graphVec = callNode->getCalleeGraphVector();
            for(unsigned j=0;j<graphVec.size();++j)
            {
                Graph* calleeGraph = graphVec[j];
                assert(calleeGraph);
                vector<Node*> externNodes = calleeGraph->getNodes();
                for(unsigned i=0;i<externNodes.size();++i)
                {
                    Node* currExtNode = externNodes[i];
                    Node* currNewNode = currExtNode->getCalleeDuplicateNode(mCallSiteId);

                    Node* origNode = currExtNode->getOriginalNode();
                    Value* lVal = origNode->getLLVMValue();
                    assert(lVal);
                    if(isa<StoreInst>(lVal))
                        createEdgesFromStoreNode(origNode, currNewNode);
                    if(isa<Argument>(lVal))
                    {
                        //0th operand of call is the function
                        Value* argVal = I.getOperand(origNode->getArgId()+1);	
                        CREATE_EDGE(argVal, currNewNode);
                    }
                    if(isa<ReturnInst>(lVal))
                    {
                        Edge* e = mGraph->createEdge(currNewNode, callNode);
                        e->setWeight(1);	//for each callNode, exactly one ret possible	
                    }
                    //why no LoadInst - edges are created by store nodes using createEdgesFromStoreNode
                }
                externNodes.clear();
            }
            if(graphVec.size() == 0)	//a library function
            {
                for(unsigned i=1;i<I.getNumOperands();++i)	//first operand is the function
                {
                    if(UtilityFunctions::isPrimitiveType(I.getOperand(i)->getType()))
                        CREATE_EDGE(I.getOperand(i), callNode);
                }
            }
        }
    }

    void GraphBuilder::visitStoreInst(StoreInst& I)
    {
        Node* storeNode = mId2Node[mNodeId];
        //cerr << "Investigating store ";
        //I.print(cerr);
        //cerr << "Node says ";
        //storeNode->getLLVMValue()->print(cerr);
        if(mDepComplexity == PROPAGATE_DEP_ANALYSIS)
        {
            if(UtilityFunctions::isPrimitiveType(I.getOperand(0)->getType()))
            {
                createEdgesFromStoreNode(storeNode, storeNode, (unsigned)mDepComplexity); //two same parameter???
                //mStoreVector.push_back(mGraph->getNode(&I));
                if(isExternallyVisible(storeNode, mGraph->getFunction()))
                    mGraph->addExternallyVisibleNode(storeNode);
            }
        }
        CREATE_EDGE(I.getPointerOperand(), &I);
        CREATE_EDGE(I.getOperand(0), &I);
    }

    void GraphBuilder::visitLoadInst(LoadInst& I)
    {
        if(mDepComplexity == PROPAGATE_DEP_ANALYSIS)
            if(UtilityFunctions::isPrimitiveType(I.getType()))
            {
                //mLoadVector.push_back(mGraph->getNode(&I));
                Node* loadNode = mId2Node[mNodeId];
                if(isExternallyVisible(loadNode, mGraph->getFunction()))
                    mGraph->addExternallyVisibleNode(loadNode);
            }
        CREATE_EDGE(I.getPointerOperand(), &I);
    }

    void GraphBuilder::buildDepEdges(Instruction& currentI)
    {
        visit(currentI);
    }


    void GraphBuilder::visitBinaryOperator(BinaryOperator& I)
    {
        CREATE_EDGE(I.getOperand(0), &I);
        CREATE_EDGE(I.getOperand(1), &I);
    }	

    void GraphBuilder::visitCmpInst(CmpInst& I)
    {
        CREATE_EDGE(I.getOperand(0), &I);
        CREATE_EDGE(I.getOperand(1), &I);
    }

    void GraphBuilder::visitGetElementPtrInst(GetElementPtrInst& I)
    {
        CREATE_EDGE(I.getPointerOperand(), &I);
        User::op_iterator idxBegin = I.idx_begin(), idxEnd = I.idx_end();
        for(;idxBegin != idxEnd; idxBegin++)
            CREATE_EDGE((*idxBegin), &I);
    }

    void GraphBuilder::visitPHINode(PHINode& I)
    {
        assert(mCFG);
        unsigned numIncoming = I.getNumIncomingValues();
        for(unsigned i=0;i<numIncoming;++i)
        {
            Edge* e = CREATE_EDGE(I.getIncomingValue(i), &I);
            if(e)
            {
                e->markWeakEdge(true);
                if(mCFG->getEdge(I.getIncomingBlock(i), I.getParent())->isBackEdge())
                    e->markBackEdge(true);
            }
        }
    }

    void GraphBuilder::visitSelectInst(SelectInst& I)
    {
        CREATE_EDGE(I.getOperand(0), &I);
        CREATE_EDGE(I.getOperand(1), &I);
        CREATE_EDGE(I.getOperand(2), &I);
    }



    void GraphBuilder::visitCastInst(CastInst& I)
    {
        CREATE_EDGE(I.getOperand(0), &I);
    }

    void GraphBuilder::visitBranchInst(BranchInst& I)
    {
        if(I.isConditional())
            CREATE_EDGE(I.getCondition(), &I);		
    }

    void GraphBuilder::visitSwitchInst(SwitchInst& I)
    {
        CREATE_EDGE(I.getCondition(), &I);		
    }

    void GraphBuilder::visitReturnInst(ReturnInst& I)
    {
        if(I.getNumOperands() > 0)
        {
            CREATE_EDGE(I.getOperand(0), &I);		
            if(mDepComplexity == PROPAGATE_DEP_ANALYSIS)
                mGraph->addExternallyVisibleNode(mId2Node[mNodeId]);
        }
    }

    Edge* GraphBuilder::CREATE_EDGE(Value* X, Value* Y)
    {
        return CREATE_EDGE(X, mGraph->getNode(Y)); 
        //if(!(mGraph->shouldBuildEdge(X)))
        //return 0; 
        //Edge* e = mGraph->createEdge(X, Y);
        //Node* pred = e->getPred();
        //Node* succ = e->getSucc();

        //if(pred->getNumDynamicInstances()  > 0)
        //{
        //e->setWeight(((double)succ->getNumDynamicInstances())/pred->getNumDynamicInstances());
        ////cerr << "Assigned edge weight "<<e->getWeight()<<endl;
        //}
        //else
        //{
        ////cerr << "zero edge weight\n";
        //e->setWeight(0);
        //}
        //return e;
    }

    Edge* GraphBuilder::CREATE_EDGE(Value* lPred, Node* Y)
    {
        if(!(mGraph->shouldBuildEdge(lPred)))
            return 0; 

        Node* X = mGraph->getNode(lPred);
        Edge* e = mGraph->createEdge(X, Y);
        Node* pred = e->getPred();
        Node* succ = e->getSucc();

        if(pred->getNumDynamicInstances()  > 0)
        {
            e->setWeight(((double)succ->getNumDynamicInstances())/pred->getNumDynamicInstances());
            //cerr << "Assigned edge weight "<<e->getWeight()<<endl;
        }
        else
        {
            //cerr << "zero edge weight\n";
            e->setWeight(0);
        }
        return e;
    }

    void GraphBuilder::createCallGraph()
    {
        ifstream fptr;
        unsigned src, dst = 0, callSite;
        vector<string> tokens;

        map<unsigned, Function*> id2Function;
        id2Function.clear();
        fptr.open("id2names.log");
        mCallGraph = new Graph();
        while(1)
        {
            tokens.clear();
            UtilityFunctions::getNextTokens(fptr, tokens);
            if(fptr.eof())
                break;
            src = UtilityFunctions::convToUInt(tokens[0]);

            //cerr << "Id "<<src<< " name #"<<tokens[1]<<"#\n";
            //Function* F = dyn_cast<Constant>(mModule->getOrInsertFunction(tokens[1], (const FunctionType*)0));
            assert(!NOTFOUND(mName2Function, tokens[1]));
            Function* F = mName2Function[tokens[1]];
            assert(F);
            //cerr << "Creating node "<<src<<endl;
            Node* X = mCallGraph->createNode(F);
            X->setLLVMId(src);
            id2Function[src] = F;
        }
        fptr.close();
        tokens.clear();

        fptr.open("call_profile.log");
        assert(fptr.is_open());
        while(1)
        {
            tokens.clear();
            UtilityFunctions::getNextTokens(fptr, tokens);
            if(fptr.eof())
                break;

            assert(tokens.size() >= 2);
            src = UtilityFunctions::convToUInt(tokens[0]);
            callSite = UtilityFunctions::convToUInt(tokens[1]);
            assert(!NOTFOUND(id2Function, src));

            uint64_t key = (((uint64_t)src) << 32 )  | ((uint64_t)callSite);

            for(unsigned j=2;j<tokens.size();++j)	
            {
                dst = UtilityFunctions::convToUInt(tokens[j]);
                assert(!NOTFOUND(id2Function, dst));
                mCallSite2Functions[key].push_back(id2Function[dst]);
                mCallGraph->createEdge(id2Function[src], id2Function[dst]);
            }
            //cerr << "Adding edge from "<<src<<" to "<<dst<<endl;
        }
        fptr.close();
        tokens.clear();
        id2Function.clear();

        mCallGraph->dumpDot("dot_callgraph");
        //string command = "dot -Tpng graphs/dot_callgraph.dot > images/callgraph.png";
        //system(command.c_str());

        //cerr << "Dumped dot file\n";
        assert(!mCallGraph->testForCycles() && "Thanks for thinking I can handle recursion!");
        //cerr << "Checked for cycles\n";

        mCallGraph->buildNearestDominatorMatrix(mDomMatrix);
    }

    void GraphBuilder::blockCounters(string blk_counters_file)
    {
        ifstream fptr;
        fptr.open(blk_counters_file.c_str());

        if(!fptr.is_open())
        {
            cerr << "Could not open file \""<<blk_counters_file<<"\"\n";
            assert(0);
        }

        cerr << "Open file " << blk_counters_file << " successfully!\n";

        unsigned src, dst, BlkId = 1;
        vector<string> tokens;
        //mBlkCounters.clear();
        while(1)
        {
            tokens.clear();
            UtilityFunctions::getNextTokens(fptr, tokens);
            if(fptr.eof())
                break;
            src = UtilityFunctions::convToUInt(tokens[0]);
            dst = UtilityFunctions::convToUInt(tokens[1]);

            while (src > BlkId)
            {
                mBlkCounters.push_back(0);
                BlkId++;
            }

            cerr << "Block "<<mBlkCounters.size()<< " count "<<dst<<endl;	
            mBlkCounters.push_back(dst);
            BlkId++;
        }
        tokens.clear();
        fptr.close();
    }

    void GraphBuilder::annotateEdgeWeights(string filename, bool getIterDistances)
    {
        ifstream fptr;
        fptr.open(filename.c_str());

        if(!fptr.is_open())
        {
            cerr << "Could not open file \""<<filename<<"\"\n";
            assert(0);
        }

        unsigned src, dst, weight;
        unsigned iterdist, num_count;
        Node* n1;
        Node* n2;
        vector<string> tokens;
        while(1)
        {
            tokens.clear();
            UtilityFunctions::getNextTokens(fptr, tokens);
            if(fptr.eof())
                break;
            assert(tokens.size() >= 3);
            src = UtilityFunctions::convToUInt(tokens[0]);
            dst = UtilityFunctions::convToUInt(tokens[1]);
            weight = UtilityFunctions::convToUInt(tokens[2]);

            assert(src < mStoreInstId2NodeId.size());
            assert(dst < mLoadInstId2NodeId.size());
            assert(mStoreInstId2NodeId[src] < mId2Node.size());
            assert(mLoadInstId2NodeId[dst] < mId2Node.size());


            n1 = mId2Node[mStoreInstId2NodeId[src]];
            n2 = mId2Node[mLoadInstId2NodeId[dst]];

            //n1->getLLVMValue()->print(cerr);
            //n2->getLLVMValue()->print(cerr);
            assert(isa<StoreInst>(n1->getLLVMValue()));
            assert(isa<LoadInst>(n2->getLLVMValue()));

            n1->addTargetLoad(n2->getLLVMNodeId(), (double)weight);
            n2->addSrcStore(n1->getLLVMNodeId(), (double)weight);

            cerr << "S-L edge "<<mStoreInstId2NodeId[src]<< "->"<<mLoadInstId2NodeId[dst]<<" wgt "
                <<(double)weight/n1->getNumDynamicInstances()<<endl;
            if(n1->getParentGraph() == n2->getParentGraph())
            {
                Graph* srcGraph = n1->getParentGraph();
                Edge* e = srcGraph->createEdge(n1, n2);
                //e->setWeight((double)weight*n2->getNumDynamicInstances()/n1->getNumDynamicInstances());
                e->setWeight((double)weight/n1->getNumDynamicInstances());

                if(getIterDistances && tokens.size() > 3)
                {
                    assert(((tokens.size() - 3) & 1) == 0);	//even number
                    for(unsigned i=3;i<tokens.size();i+=2)
                    {
                        iterdist = UtilityFunctions::convToUInt(tokens[i]);
                        num_count = UtilityFunctions::convToUInt(tokens[i+1]);
                        e->addLoopIterDistanceCount(iterdist, num_count);
                    }
                }
            }
            else
                cerr << "Store->load not in the same function - no edge added\n";
        }

        fptr.close();
        tokens.clear();
    }

    void GraphBuilder::createEdgesFromStoreNode(Node* srcOrigNode, Node* srcNewNode, unsigned depComplexity)
    {
        assert(srcNewNode->getParentGraph() == mGraph);
        vector<unsigned> endpoints = srcOrigNode->getTargetLoadIds();
        vector<Node*> targetNodesVec;
        targetNodesVec.clear();
        for(unsigned j=0;j<endpoints.size();++j)
        {
            //unsigned nodeId = mLoadInstId2NodeId[endpoints[j]];
            unsigned dstOrigNodeId = endpoints[j];
            assert(dstOrigNodeId && dstOrigNodeId < mId2Node.size());
            Node* dstOrigNode = mId2Node[dstOrigNodeId];
            assert(dstOrigNode);
            Node* dstNewNode = 0;

            targetNodesVec.clear();

            //the annotateEdgeWeights function would have handled this anyway, so don't 
            //bother to add another edge
            if(dstOrigNode->getFunction() == mGraph->getFunction() && 
                    srcOrigNode->getFunction() == mGraph->getFunction())
                continue;

            //other node belongs to current function, srcOrigNode belongs to different function
            if(dstOrigNode->getFunction() == mGraph->getFunction() && 
                    srcOrigNode->getFunction() != mGraph->getFunction())
                targetNodesVec.push_back(dstOrigNode);

            //other node belongs to some other function - see if any callee function propagates that node up
            if(dstOrigNode->getFunction() != mGraph->getFunction() && 
                    dstOrigNode->checkIfCalleeDuplicatesExist())	
            {
                //meaning this node has some duplicates in the current function, created by call() nodes
                vector<Node*> calleeDupVec  = dstOrigNode->getCalleeDuplicateNodes();
                for(unsigned k=0;k<calleeDupVec.size();++k)
                {
                    dstNewNode = calleeDupVec[k];

                    //both nodes are propagated by the same called function, then skip
                    if(dstNewNode->getCalledFunction() && srcNewNode->getCalledFunction()
                            && dstNewNode->getCalledFunction() == srcNewNode->getCalledFunction())
                        continue;

                    targetNodesVec.push_back(dstNewNode);
                }
                calleeDupVec.clear();
            }
            for(unsigned k=0;k<targetNodesVec.size();++k)
            {
                dstNewNode = targetNodesVec[k];
                assert(dstNewNode->getParentGraph() == mGraph);
                Edge* e = mGraph->createEdge(srcNewNode, dstNewNode);
                e->setWeight((double)srcOrigNode->getTargetLoadIdWeight(j)
                        /dstOrigNode->getNumDynamicInstances());
                //e->setWeight(((double)srcOrigNode->getTargetLoadIdWeight(j)*
                //srcOrigNode->getNumDynamicInstances())
                ///dstOrigNode->getNumDynamicInstances());
            }
        }
        endpoints.clear();
        targetNodesVec.clear();
    }

    bool GraphBuilder::isExternallyVisible(Node* X, Function* F)
    {
        if(F->getName() == "main")  //???
            return true;

        if(X->getNumDynamicInstances() == 0)
            return false;
        //unsigned llvmId = X->getLLVMNodeId();
        Value* llvmValue = X->getLLVMValue();
        Node* origNode = X->getOriginalNode();
        vector<unsigned> endpoints;
        if(isa<StoreInst>(llvmValue))
            endpoints = origNode->getTargetLoadIds();
        else
            if(isa<LoadInst>(llvmValue))
                endpoints = origNode->getSrcStoreIds();
            else
                assert(0);

        Node* currCallNode = mCallGraph->getNode(F);

        //cerr << "Curr call node id "<<currCallNode->getId()<<endl;

        Function* origFunction = origNode->getParentGraph()->getFunction();
        Node* srcCallNode = mCallGraph->getNode(origFunction);
        bool returnVal = false;
        for(unsigned i=0;i<endpoints.size();++i)
        {
            assert(endpoints[i] < mId2Node.size());
            Node* succNode = mId2Node[endpoints[i]];

            //cerr << "For node "<<llvmValue->getName()<< "("<<X->getLLVMNodeId()<< ")"<<
            //" endpoint "<< succNode->getLLVMValue()->getName()<< "("<<succNode->getLLVMNodeId()<<")"
            //<< endl;
            Function* succFunction = succNode->getParentGraph()->getFunction();
            Node* succFunctionNode = mCallGraph->getNode(succFunction);

            //cerr << "Caller ids "<<srcCallNode->getId()<< " "<<succFunctionNode->getId()<< " Dominating function "<<mDomMatrix[srcCallNode->getId()][succFunctionNode->getId()]->getLLVMValue()->getName() << " id "<<mDomMatrix[srcCallNode->getId()][succFunctionNode->getId()]->getId()<<endl;
            assert(mDomMatrix[srcCallNode->getId()][succFunctionNode->getId()]);
            if(mDomMatrix[srcCallNode->getId()][succFunctionNode->getId()]->getId() < currCallNode->getId())
            {
                cerr << "Node belonging to function "<<X->getFunction()->getName()<<" Visible outside function "<<F->getName()<< " : ";
                X->getLLVMValue()->print(cerr);
                returnVal = true;
                break;
            }
        }
        endpoints.clear();
        return returnVal;
    }

    void GraphBuilder::runJohnsonOnly(unsigned numNodes)
    {
        system("mkdir -p graphs");
        system("mkdir -p images");

        mGraph = new Graph();
        for(unsigned i=0;i<numNodes;++i)
        {
            Node* X = mGraph->createNode();
            X->setLLVMId(i);
            X->setNumDynamicInstances(1000);
        }
        //totally connected graph
        for(unsigned i=0;i<numNodes-1;++i)
            //for(unsigned j=i+1;j<numNodes;++j)
        {
            //#total graph
            //Edge* e1 = mGraph->createEdge(mGraph->getNode(i), mGraph->getNode(j));
            //Edge* e2 = mGraph->createEdge(mGraph->getNode(j), mGraph->getNode(i));

            //#cycle
            //Edge* e1 = mGraph->createEdge(mGraph->getNode(i), mGraph->getNode((i+1)%numNodes));

        }
        //#nested loop
        //if(mGraph->getNumNodes() > 7)
        //Edge* e1 = mGraph->createEdge(mGraph->getNode(5), mGraph->getNode(2));


        srand(time(0));
        unsigned numEdges = rand()%((numNodes*(numNodes-1)) >> 2);
        cerr << "Num edges "<<numEdges<<endl;
        set<pair<unsigned, unsigned> > edgeMap;
        edgeMap.clear();
        for(unsigned i=0;i<numEdges;++i)
        {
            unsigned pred = rand()%numNodes;
            unsigned succ = rand()%numNodes;
            if(pred != succ && NOTFOUND(edgeMap,make_pair(pred,succ)))
            {
                Edge* e = mGraph->createEdge(mGraph->getNode(pred), mGraph->getNode(succ));
                edgeMap.insert(make_pair(pred,succ));
                e->setWeight(1);
            }
        }
        edgeMap.clear();


        mGraph->createSCCGraph();
        mGraph->Johnson_Elementary_Cycles();
        cerr << "Completed johnson cycles\n";

        mGraph->dumpDot("graph");

        //string command = "dot -Tpng graphs/graph.dot > images/graph.png";
        //system(command.c_str());		
    }

    void GraphBuilder::buildCFG(Function* F, LoopInfo* loopInfo, unsigned& blkId)
    {
        cerr << "Enter buildCFG, curr function: "<< F<< "!\n";
        Function::iterator I = F->begin();
        Function::iterator E = F->end();

        Graph* cdfg = new Graph();
        for (; I != E; ++I)
        {
            cerr << "blkId: " << blkId << ", #blks: "<< mBlkCounters.size() << endl;
            assert(blkId < mBlkCounters.size());
            Node* currNode = cdfg->createNode(&(*I));
            currNode->setNumDynamicInstances(mBlkCounters[blkId]);
            currNode->setLLVMId(blkId++);
        }
        I = F->begin();
        E = F->end();

        cerr << "before loopDataStructure!\n";

        LoopDataStructure loopDataStructure;
        loopDataStructure.runOnFunction(F, loopInfo, false);

        cerr << "after loopDataStructure!\n";

        vector<BasicBlock*> predBlks;
        for (; I != E; ++I)
        {
            predBlks.clear();
            UtilityFunctions::getPredecessorBlks(&(*I), predBlks);
            for(unsigned i=0;i<predBlks.size();++i)
            {
                Edge* e = cdfg->createEdge(predBlks[i], &(*I));
                if(loopDataStructure.isBackEdge(predBlks[i], &(*I)))
                    e->markBackEdge(true);
            }
        }

        cerr << "Before topoSort!!!\n";

        cdfg->topoSort(true);
        mFunction2CFG[F] = cdfg;
        predBlks.clear();

        loopDataStructure.clear();

        cerr << "buildCFG ends!!!\n";
    }
}

