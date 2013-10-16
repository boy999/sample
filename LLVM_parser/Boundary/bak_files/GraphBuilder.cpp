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
    ofstream gOutputFptr;
	Function* GraphBuilder::getFunction(Value* v)
	{
        if(isa<Function>(v))
//            cerr << "Input Value is the pointer to Function" << endl;
		if(isa<Constant>(v))
        {
//            cerr << "Input Value is the pointer to Constant" << endl;
			return 0;
        }
		if(isa<Instruction>(v) && (dyn_cast<Instruction>(v))->getParent())
        {
//            cerr << "Input value is the pointer to Instruction" << endl;
			return (dyn_cast<Instruction>(v))->getParent()->getParent();
        }
		if(isa<Argument>(v))
        {
//            cerr << "Input value is the pointer to Argument" << endl;
			return (dyn_cast<Argument>(v))->getParent();
        }
		if(isa<BasicBlock>(v))
        {
//            cerr << "Input value is the pointer to BasicBlock" << endl;
			return (dyn_cast<BasicBlock>(v))->getParent();
        }
//		assert(0);
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

		//mBlkCounters.clear();
		mName2Function.clear();
		mName2LLVMVal.clear();
        mFunctionVector.clear();
	}

	void GraphBuilder::reset()
	{
		mDuplicatedNodes.clear();
	}	

	bool GraphBuilder::doInitialization(Module& M)
	{
//        cerr << "Entering do Initialization\n";
		clear();

        mXeonPorts.clear();
        mAtomPorts.clear();

        cerr << "after clear\n";
//        mXeonPorts[INT_ALU].push_back(0);
        mXeonPorts[INT_ALU] = 1; // 5 is also OK
//        mXeonPorts[INT_ALU].push_back(5);
//        mXeonPorts[FP_ALU].push_back(0);
        mXeonPorts[FP_ALU] = 0;
  //      mXeonPorts[FP_ADD].push_back(1);
  //      mXeonPorts[FP_MUL].push_back(0);
  //      mXeonPorts[FP_DIV].push_back(0);
        mXeonPorts[LOAD] = 2;
        mXeonPorts[STOREADD] = 3;
        mXeonPorts[STOREDATA] = 4;
        mXeonPorts[OTHER] = 6;
/*
 *      mXeonPorts[LOAD].push_back(2);
        mXeonPorts[STOREADD].push_back(3);
        mXeonPorts[STOREDATA].push_back(4);
        mXeonPorts[OTHER].push_back(6);
*/
        mAtomPorts[INT_ALU] = 0;
        mAtomPorts[LOAD] = 0;
        mAtomPorts[STOREADD] = 0;
        mAtomPorts[STOREDATA] = 0;
        mAtomPorts[FP_ALU] = 1;
//        mAtomPorts[FP_ADD].push_back(1);
//        mAtomPorts[FP_MUL].push_back(1);
//        mAtomPorts[FP_DIV].push_back(1);
        mAtomPorts[OTHER] = 2;
        
        cerr << "before mkdir\n";
		system("mkdir -p graphs");
		system("mkdir -p images");

		//First one is don't care
		mNodeId = 1;
		mBlkId = 1;
		mFunctionId = 1;

		mLoadInstId2NodeId.push_back(0);	//invalid id 0
		mStoreInstId2NodeId.push_back(0);
		//mBlkCounters.push_back(0);
		mId2Node.push_back(0);

        for (Module::iterator I = M.begin(), E = M.end(); I != E; ++I)
	{
            mName2Function[(*I).getName()] = &(*I);
	    mName2LLVMVal[(*I).getName()] = &(*I);
	}

        cerr<< "before get loop_enter function\n";
        mEnterLoopF = M.getFunction("loop_enter");
        assert(mEnterLoopF);

        cerr << "Before open LoopTest.log\n";
        mIgnoreSet.clear();
        gOutputFptr.open("LoopTest.log",ios::out);
//        cerr << "Exiting do Initialization\n";
		return false;
	}

//	bool GraphBuilder::runOnModule(Module& M, string dep_edge_filename, string blk_profile_name)
//	bool GraphBuilder::runOnModule(Module& M, DriverGraphPass* driverPass, string dep_edge_filename, string blk_profile_name)
	void GraphBuilder::LoopLabeling(Loop* l)
	{
		mName2LLVMVal[l->getHeader()->getName()] = l->getHeader();
		vector<Loop*> subLoops;
		subLoops.clear();
		subLoops = l->getSubLoops();
		unsigned i;
		for(i=0;i<subLoops.size();++i)
		{
			assert(subLoops[i]);
			LoopLabeling(subLoops[i]);
		}
		subLoops.clear();
	}

	bool GraphBuilder::runOnModule(Module& M, DriverGraphPass* driverPass, string dep_edge_filename)
	{

		mDriverPass = driverPass;

		cerr << "before do initialization\n";
		doInitialization(M);	
		//      cerr << "Before blockCounters\n";
		//block counts       
		//		blockCounters(blk_profile_name);
		//      cerr << "After blockCounters\n";

		for (Module::iterator I = M.begin(), E = M.end(); I != E; ++I)
		{
			Function& F = (*I);
			if (!(F.isDeclaration()))
			{	
				LoopInfo* loopInfoPass = mDriverPass->getLoopInfo(&F);
			        LoopInfo::iterator lBegin = loopInfoPass->begin(), lEnd = loopInfoPass->end();
			        //Loopid passed by reference
			        //unsigned loopId = 0;
			        for(;lBegin != lEnd;++lBegin)
				{
			             LoopLabeling(*lBegin);
				}
			}
		}

		mNodeId = 1;
		mBlkId = 1;
		mFunctionId = 1;

		//Call graph
		cerr << "Before create Call Graph\n";
		createCallGraph();		

		cerr << "Before Build CFG\n";
		mLoopId = 1;

		for (Module::iterator I = M.begin(), E = M.end(); I != E; ++I)
		{
			Function& F = (*I);
			if (!(F.isDeclaration()))
				buildCFG(&F, mDriverPass->getLoopInfo(&F), mBlkId);
		}

		mLoopId = 1;

		/*
		   cerr << "Before runFirstPass\n";
		   for (Module::iterator I = M.begin(), E = M.end(); I != E; ++I)
		   {
		   Function& F = (*I);
		   if(!(F.isDeclaration()))
            {
				runOnFunction(F, 0);
    			++mFunctionId;
            }
        }

        for (Module::global_iterator I = M.global_begin(), E = M.global_end(); I != E; ++I)
        {
            GlobalVariable& currentI = (*I); 
            Node* currNode = mGraph->createNode(&currentI);
            mId2Node.push_back(currNode);

            currNode->setLLVMId(mNodeId);
            
            cerr << "Global Variable: " << I->getName() << "; the type is : " << I->getType() 
                << "; mNodeId: " << mNodeId << endl;
            ++mNodeId;
        }

        cerr << "\n## Annotating edge weights from profiling\n";
        //store->load edges
//        annotateEdgeWeights(dep_edge_filename);

        cerr << "\n## Finish Annotating edge weights from profiling\n";
        mNodeId = 1;
        mBlkId = 1;
        mFunctionId = 1;

        for (Module::iterator I = M.begin(), E = M.end(); I != E; ++I)
        {
            Function* F = &(*I);

            if(!(F->isDeclaration()))
            {
                Graph* DFG = mFunction2Graph[F];
                Graph* CFG = mFunction2CFG[F];
                assert(DFG);
                assert(CFG);
                DFG->setCFG(CFG);
                CFG->setDFG(DFG);
                mBlkId = CFG->getNode((unsigned)0)->getLLVMNodeId();
                Function::arg_iterator aB = F->arg_begin();
                Function::arg_iterator aE = F->arg_end();

                unsigned argId = 0;
                for(;aB != aE;aB++,++argId) { }

                //mNodeId = DFG->getNode((unsigned)0)->getLLVMNodeId();
                mNodeId = DFG->getNode(argId)->getLLVMNodeId();

                runOnFunction(*F, 2);
                ++mFunctionId;
            }
        }
        */
/*
        vector<Node*> callGraphNodes = mCallGraph->getNodes();

        cerr << "\n## Got CallGraphNodes: size = " << callGraphNodes.size() << endl;

        //for(int i=((int)(callGraphNodes.size()) - 1);i>=0;--i)  //??? i=size-1 ?
        for(int i=((int)(callGraphNodes.size()) - 1);i>=0;--i)  //??? i=size-1 ?
        {
            //Function* F = &(*I);
            Node* currNode = callGraphNodes[i];

            Function* F = dyn_cast<Function>(currNode->getLLVMValue());
            cerr << "Before Assert\n";
            assert(F);
            cerr << "After Assert\n";
            cerr << "Processing Function: " << F->getName() << endl;

            mFunctionId = currNode->getLLVMNodeId();
            Graph* DFG = mFunction2Graph[F];
            Graph* CFG = mFunction2CFG[F];
            assert(DFG);
            assert(CFG);
            DFG->setCFG(CFG);
            CFG->setDFG(DFG);
            mBlkId = CFG->getNode((unsigned)0)->getLLVMNodeId();
            Function::arg_iterator aB = F->arg_begin();
	    	Function::arg_iterator aE = F->arg_end();

            unsigned argId = 0;
    		for(;aB != aE;aB++,++argId) { }

            //mNodeId = DFG->getNode((unsigned)0)->getLLVMNodeId();
            mNodeId = DFG->getNode(argId)->getLLVMNodeId();
            if(!(F->isDeclaration()))
                runOnFunction(F, 2);
            //++mFunctionId;
        }                                   
*/
        /*
         * old codes:
         for (Module::iterator I = M.begin(), E = M.end(); I != E; ++I)
         {
         Function& F = (*I);
         if(!(F.isDeclaration()))
         {
         runOnFunction(F, 2);
    			++mFunctionId;
            }
		}
        */
        
//        gOutputFptr.close();

		return false;	
	}

	bool GraphBuilder::runOnFunction(Function& F, unsigned passId)
	{
		return runOnFunction(&F, passId);
	}

	//bool GraphBuilder::runSimplePass(Module& M, string dep_edge_filename, string blk_profile_name, 
	bool GraphBuilder::runSimplePass(Module& M, string dep_edge_filename, 
			unsigned nodeType)
	{
		doInitialization(M);

		//block counts
		//blockCounters(blk_profile_name);
		
		mNodeId = 1;
		mBlkId = 1;
		//unsigned tmpNodeId;
		//unsigned tmpBlkId;
		mGraph = new Graph();
		for (Module::iterator I = M.begin(), E = M.end(); I != E; ++I)
		{
			Function& F = (*I);
			if(!(F.isDeclaration()))
			{
				reset();
				mGraph = new Graph();
				mGraph->setFunction(&F);

				//tmpNodeId = mNodeId;
				//tmpBlkId = mBlkId;
			
				runFirstPass(&F, nodeType);			//create the nodes for each function
				mFunction2Graph[&F] = mGraph;	

				//mNodeId = tmpNodeId;
				//mBlkId = tmpBlkId;
			}
		}	

		//store->load edges
		annotateEdgeWeights(dep_edge_filename);
		
		mNodeId = 1;
		mBlkId = 1;
		for (Module::iterator I = M.begin(), E = M.end(); I != E; ++I)
		{
			Function& F = (*I);
			if(!(F.isDeclaration()))
			{
				mGraph = mFunction2Graph[&F];
				runSimpleDepEdgesPass(&F);		//build edges
				mGraph->dumpDot("pdg");
				mGraph->identifySCCs();
				cerr << "\nStarting Johnson's cycle enumeration technique\n";	
				mGraph->Johnson_Elementary_Cycles();
			}
		}
		return false;
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
				//runSecondPass(F);
				
				
				break;
		}

		return false;
	}

	void GraphBuilder::runFirstPass(Function* F, unsigned nodeType)
	{
		//cerr << "Came here\n";
		Function::arg_iterator aB = F->arg_begin();
		Function::arg_iterator aE = F->arg_end();

//		if(mBlkCounters.size() < mBlkId)
//			mBlkCounters.push_back(0);
		unsigned argNumInstances = 1;	
//		if(F->begin() != F->end())
//			argNumInstances = mBlkCounters[mBlkId];	//first block of the function

		unsigned argId = 0;
		for(;aB != aE;aB++,++argId)
		{
			Node* argNode = mGraph->createNode(&(*aB), nodeType);
			argNode->setArgId(argId);
//			argNode->setNumDynamicInstances(argNumInstances);
            //add to count the argNode
        //    argNode->setLLVMId(mNodeId);
			mGraph->addExternallyVisibleNode(argNode);

            //add to count the argNode;
          //  ++mNodeId;
		}
		
		Function::iterator I = F->begin();
		Function::iterator E = F->end();

		for (; I != E; ++I)
		{
//			if(mBlkCounters.size() < mBlkId)
//				mBlkCounters.push_back(0);
			for (BasicBlock::iterator II = I->begin(), IE = I->end();
					II != IE; ++II)
			{
				Instruction& currentI = (*II);
                if (!NOTFOUND(mIgnoreSet, &currentI))
                    continue;
				Node* currNode = mGraph->createNode(&currentI, nodeType);
				mId2Node.push_back(currNode);
				
				currNode->setLLVMId(mNodeId);
				currNode->setFunction(F);
//				currNode->setNumDynamicInstances(mBlkCounters[mBlkId]);
				
				//original codes:
                //if(isa<LoadInst>(currentI) && UtilityFunctions::isPrimitiveType(currentI.getType()))
				if(isa<LoadInst>(currentI) && !isa<PointerType>(currentI.getType()))
					mLoadInstId2NodeId.push_back(mNodeId);
				//if(isa<StoreInst>(currentI) && UtilityFunctions::isPrimitiveType
				//		(currentI.getOperand(0)->getType()))
				if(isa<StoreInst>(currentI) && !isa<PointerType>(currentI.getOperand(0)->getType()))
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
				buildDepEdges(currentI);
				++mNodeId;
			}
		}
	}

    void GraphBuilder::calculateBlkILP(BasicBlock* blkptr, unsigned blkId)
    {
        cerr << "Begin calculateBlkILP mNodeId : " << mNodeId << "\n";
        std::set<unsigned> readyInst;
        std::set<unsigned> currInstSet;
        readyInst.clear();
        currInstSet.clear();

        int XeonCycle = 0;
        int AtomCycle = 0;

        int XeonPorts[7];
        int AtomPorts[3];
        int iter = 0;
        unsigned initNodeId = mNodeId;
        cerr << "Begin Instruction: ";
        blkptr->begin()->print(cerr);
        cerr << endl;
        cerr << "End Instruction: ";
        blkptr->getTerminator()->print(cerr);
        cerr << endl;

        Instruction* FirstI;
        for (BasicBlock::iterator II = blkptr->begin(), IE = blkptr->end();
                II != IE; ++II)
        {
            FirstI = &(*II);
            if(NOTFOUND(mIgnoreSet, FirstI))
            {
                break;
            }
        }

        //int beginIndex = mGraph->GEtNode(blkptr->begin())->getLLVMNodeId();
        int beginIndex = mGraph->getNode(FirstI)->getLLVMNodeId();
        int endIndex = mGraph->getNode(blkptr->getTerminator())->getLLVMNodeId();
        gOutputFptr << "Basic Block Begin Index: " << beginIndex << "; End Index: " << endIndex << endl;
        int BlkSize = blkptr->size();

        cerr << "mNodeId : " << mNodeId<< endl;
        for (BasicBlock::iterator II = blkptr->begin(), IE = blkptr->end();
                   II != IE; ++II)
        {
            Instruction& currentI = (*II);
            currentI.print(cerr);
            cerr << endl;
        }

        cerr << "mId2Node: " << endl;
        for (int i = beginIndex; i <= endIndex; i++)
        {
            cerr << "node "<< i << " : " ;
            mId2Node[i]->getLLVMValue()->print(cerr);
            cerr << endl;
        }
        while(readyInst.size() < BlkSize)
        {
            cerr << "Begin Xeon Iter: " << iter << endl;
            for (int i = 0; i < 7; i++)
            {
                XeonPorts[i] = 0;
            }

            mNodeId = initNodeId;
            for (BasicBlock::iterator II = blkptr->begin(), IE = blkptr->end();
                   II != IE; ++II)
            {
                Instruction& currentI = (*II);
                if(!NOTFOUND(mIgnoreSet, &currentI))
                {
                    BlkSize--;
                    continue;
                }
                
                Node* currNode = mGraph->getNode(&currentI);
               
                if (readyInst.find(currNode->getLLVMNodeId()) != readyInst.end())
                {
                    mNodeId++;
                    continue;
                }
                //vector<Node*> predNodes = currNode->getPredecessors();
                vector<Node*> predNodes = mGraph->getPredecessors(currNode);
                int flag = 0;
                cerr << "currNode id: " << currNode->getLLVMNodeId() << "; predNodes' size: " << predNodes.size() << "\n\t";
                for (int i = 0; i< predNodes.size(); i++)
                {
                    cerr << i << "th predNode Id :" << predNodes[i]->getLLVMNodeId() << "; ";
                    if ( (predNodes[i]->getLLVMNodeId() >= beginIndex)
                            && (predNodes[i]->getLLVMNodeId() < endIndex) )
                    {
                        if (readyInst.find(predNodes[i]->getLLVMNodeId()) == readyInst.end())
                        {
                            flag = 1;
                            break;
                        }
                        else
                        {
                            flag = 0;
                        }
                    }
                }
                cerr << endl;

                if (flag == 0)
                {
                    if(mNodeId2InstType[mNodeId] == INT_ALU)
                    {
                       if (XeonPorts[1] == 0)
                       {
                           XeonPorts[1] = 1;
                           assert(currNode->getLLVMNodeId() == mNodeId);
                           cerr << "insert: mNodeId " << mNodeId << " ";
                           currNode->getLLVMValue()->print(cerr);
                           cerr << endl;
                           currInstSet.insert(currNode->getLLVMNodeId());                   
                       }
                       else if (XeonPorts[5] == 0)
                       {
                           XeonPorts[5] = 1;
                           assert(currNode->getLLVMNodeId() == mNodeId);
                           cerr << "insert: mNodeId " << mNodeId << " ";
                           currNode->getLLVMValue()->print(cerr);
                           cerr << endl;

                           currInstSet.insert(currNode->getLLVMNodeId());                   
                       }
                    }
                    else if (XeonPorts[mXeonPorts[mNodeId2InstType[mNodeId]]] == 0)
                    {
                        XeonPorts[mXeonPorts[mNodeId2InstType[mNodeId]]] = 1;
   
                        cerr << "Basic Block name: " << blkptr->getName() 
                         << "Basic block id: " << blkId 
                        << "readyInst.size(): " << readyInst.size() << "; "
                        << "blkptr->size(): " << blkptr->size() << ";\n";
    
                        currentI.print(cerr);
                        cerr << "LLVMNodeId: " << currNode->getLLVMNodeId()
                            << "; mNodeId: " << mNodeId << endl;

                        assert(currNode->getLLVMNodeId() == mNodeId);
                           cerr << "insert: mNodeId " << mNodeId << " ";
                           currNode->getLLVMValue()->print(cerr);
                           cerr << endl;

                        currInstSet.insert(currNode->getLLVMNodeId());
                    }               
                }
                ++mNodeId;
            }

            iter++;
            XeonCycle++;
            for (std::set<unsigned>::iterator it=currInstSet.begin(); it!=currInstSet.end(); it++)
            {
                cerr << "add instruction nodeId:" << (*it) << endl;
//                mGraph->getNode(*it)->getLLVMValue()->print(cerr);
                mId2Node[(*it)]->getLLVMValue()->print(cerr);
                cerr << endl;
                readyInst.insert(*it);
            }

            currInstSet.clear();

            if (iter > 10*blkptr->size())
            {
                cerr << "Basic Block name: " << blkptr->getName() 
                    << "Basic block id: " << blkId 
                    << "readyInst.size(): " << readyInst.size() << "; "
                    << "blkptr->size(): " << blkptr->size() << ";\n";
                for (std::set<unsigned>::iterator it=readyInst.begin(); it!=readyInst.end(); it++)
                {
                    mGraph->getNode(*it)->getLLVMValue()->print(cerr);
                    cerr << endl;
                }
/*
                for (BasicBlock::iterator II = blkptr->begin(), IE = blkptr->end();
                        II != IE; ++II)
                {
                    Instruction& currentI = (*II);
                    currentI.print(cerr);
                    cerr << endl;
                }
*/
                assert(0&&"deadlock happens in the function calculateBlkILP!!!\n");
            }
        }

        cerr << "mNodeId : " << mNodeId<< endl;
        for (BasicBlock::iterator II = blkptr->begin(), IE = blkptr->end();
                   II != IE; ++II)
        {
            Instruction& currentI = (*II);
            currentI.print(cerr);
            cerr << endl;
        }
        mBlkId2XeonCycle[blkId] = XeonCycle;
        readyInst.clear();
        iter = 0;
        BlkSize = blkptr->size();
        while(readyInst.size() < BlkSize)
        {
            cerr << "Begin Atom Iter: " << iter << endl;

            for (int i = 0; i < 3; i++)
            {
                AtomPorts[i] = 0;
            }

            mNodeId = initNodeId;
            for (BasicBlock::iterator II = blkptr->begin(), IE = blkptr->end();
                   II != IE; ++II)
            {
                Instruction& currentI = (*II);
                if(!NOTFOUND(mIgnoreSet, &currentI))
                {
                    BlkSize--;
                    continue;
                }
                Node* currNode = mGraph->getNode(&currentI);
                if(readyInst.find(currNode->getLLVMNodeId()) != readyInst.end())
                {
                    mNodeId++;
                    continue;
                }

                //vector<Node*> predNodes = currNode->getPredecessors();
                vector<Node*> predNodes = mGraph->getPredecessors(currNode);
                int flag = 0;
                for (int i = 0; i< predNodes.size(); i++)
                {
                    if ( (predNodes[i]->getLLVMNodeId() >= beginIndex)
                            && (predNodes[i]->getLLVMNodeId() < endIndex) )
                    {
                        if (readyInst.find(predNodes[i]->getLLVMNodeId()) == readyInst.end())
                        {
                            flag = 1;
                            break;
                        }
                        else
                        {
                            flag = 0;
                        }
                    }
                }
                if (flag == 0)
                {
                    if (AtomPorts[mAtomPorts[mNodeId2InstType[mNodeId]]] == 0)
                    {
                        AtomPorts[mAtomPorts[mNodeId2InstType[mNodeId]]] = 1;
                        assert(currNode->getLLVMNodeId() == mNodeId);
                        currInstSet.insert(currNode->getLLVMNodeId());
                    }              
                    else
                    {
                        break;
                    }
                }
                else
                {
                    break;
                }
                ++mNodeId;
            }

            iter++;
            AtomCycle++;
            for (std::set<unsigned>::iterator it=currInstSet.begin(); it!=currInstSet.end(); it++)
            {
                    readyInst.insert(*it);
                    cerr << "add instruction:" << endl;
 //                   mGraph->getNode(*it)->getLLVMValue()->print(cerr);
                    cerr << endl;
            }
            currInstSet.clear();

            if (iter > 10*blkptr->size())
            {
                cerr << "Basic Block name: " << blkptr->getName()
                    << "Basic block id: " << blkId
                    << "readyInst.size(): " << readyInst.size() << "; "
                    << "BlkSize: " << BlkSize << "; "
                    << "blkptr->size(): " << blkptr->size() << ";\n";
                assert(0&&"deadlock happens in the function calculateBlkILP!!!\n");
            }
        }
        mBlkId2AtomCycle[blkId] = AtomCycle;
        cerr << "Finish calculateBlkILP mNodeId : " << mNodeId << endl;

    }

    void GraphBuilder::updateLoopILP(Loop* lp)
    {

        unsigned lpId = mHeader2LoopId[lp->getHeader()];
      
        assert(isa<PHINode>(mLoopId2HeaderPHI[lpId]));
        
        gOutputFptr << "visiting Loop : " << lpId << " ; \n";
        gOutputFptr << "\tHeaderPHINode Id: " << mGraph->getNode(mLoopId2HeaderPHI[lpId])->getLLVMNodeId() << endl;
        gOutputFptr << "\tHeaderPHI Basic Block Id: " << mCFG->getNode(mLoopId2Header[lpId])->getLLVMNodeId() << endl;
        mLoopId2HeaderPHI[lpId]->print(gOutputFptr);

        for (int i = 0 ; i < mLoopId2Branch[lpId].size(); i++) 
        {
            gOutputFptr << "\t " << i << "th Branch Block Id: " << mCFG->getNode(mLoopId2Branch[lpId][i])->getLLVMNodeId() << endl;
        }

        for (int i = 0; i < mLoopId2BRInst[lpId].size(); i++)
        {
            assert(isa<TerminatorInst>(mLoopId2BRInst[lpId][i]));
            gOutputFptr << "\t " << i << "th BRINST Id: " << mGraph->getNode(mLoopId2BRInst[lpId][i])->getLLVMNodeId() << endl;
            mLoopId2BRInst[lpId][i]->print(gOutputFptr);
        }

        lp->print(gOutputFptr);
        gOutputFptr << endl;
        
        vector<Loop*> subLoops;
        subLoops.clear();
        subLoops = lp->getSubLoops();

        unsigned i = subLoops.size();
        for(i=0;i<subLoops.size();++i)
        {
            assert(subLoops[i]);
            updateLoopILP(subLoops[i]);
        }

        subLoops.clear();
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
				createEdgesFromStoreNode(storeNode, storeNode, (unsigned)mDepComplexity);
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
        cerr << "visit Load Inst: mNodeId: " << mNodeId;
        I.print(cerr);
        cerr << endl;
        //cerr << "the Pointer operand of the node is : Node Id: " 
        //    << mGraph->getNode(I.getPointerOperand())->getLLVMNodeId() << endl;
        I.getPointerOperand()->print(cerr);
        cerr << endl;
	}
	
	void GraphBuilder::buildDepEdges(Instruction& currentI)
	{
        if (isa<LoadInst>(&currentI))
        {
            mNodeId2InstType[mNodeId] = LOAD;
        }
        else if (isa<StoreInst>(&currentI))
        {
            StoreInst* I = dyn_cast<StoreInst>(&currentI);
            if(UtilityFunctions::isPrimitiveType(I->getOperand(0)->getType()))
            {
                mNodeId2InstType[mNodeId] = STOREDATA;
            }
            else
            {
                mNodeId2InstType[mNodeId] = STOREADD;
            }
        }
        else if ((currentI.getType())->isFloatingPoint() )
        {
            mNodeId2InstType[mNodeId] = FP_ALU;
        }
        else if ((currentI.getType())->isInteger())
        {
            mNodeId2InstType[mNodeId] = INT_ALU;
        }
        else
        {
            mNodeId2InstType[mNodeId] = OTHER;
        }

        currentI.print(cerr);
        cerr << endl;
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
        /*
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

        for(unsigned i=0;i<numIncoming;++i)
        {
            CREATE_EDGE(I.getIncomingBlock(i)->getTerminator(), &I);
        }
        */
    } 
/*
	void GraphBuilder::visitPHINode(PHINode& I)
	{
		unsigned numIncoming = I.getNumIncomingValues();
		for(unsigned i=0;i<numIncoming;++i)
			CREATE_EDGE(I.getIncomingValue(i), &I);
	}
*/
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
        {
			CREATE_EDGE(I.getCondition(), &I);		
            cerr << "###BranchInst: ";
            I.print(cerr);
            cerr << endl;
        }
        
//        if (I == (*(I.getParent()->getTerminator())))
//        visitTerminatorInst(I);
	}
   

    void GraphBuilder::visitTerminatorInst(TerminatorInst &I)
    {
        cerr << "###Terminator Inst: ";
        gOutputFptr << "Visit Terminator Inst: \n\t";
        I.print(gOutputFptr);
        gOutputFptr << endl;
        /*
        I.print(cerr);
        cerr << endl;
        BasicBlock* blk = I.getParent();
        BasicBlock::iterator II = blk->begin();
        BasicBlock::iterator IE = blk->end();

        for (;II!=IE; II++)
        {
            cerr << "create edges: ";
            II->print(cerr);
            cerr << endl;
            Instruction* Inst = &(*II);
            CREATE_EDGE(Inst, &I);
        }
        */
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
        if(isa<ConstantInt>(X) || isa<ConstantFP>(X) || isa<GlobalVariable>(X))
            return 0;
        
        return CREATE_EDGE(X, mGraph->getNode(Y));
    }

/* old codes:
	void GraphBuilder::CREATE_EDGE(Value* X, Value* Y)
	{
		if(isa<Constant>(X))	//don't bother with constants
			return;
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
	}
*/
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

    /* old codes:
	void GraphBuilder::CREATE_EDGE(Value* lPred, Node* Y)
	{
		if(isa<Constant>(lPred))	//don't bother with constants
			return;

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
	}
*/
	void GraphBuilder::createCallGraph()
	{
		ifstream fptr;
		unsigned src, dst = 0, callSite;
		vector<string> tokens;

		//map<unsigned, Function*> id2Function;
		map<unsigned, Value*> id2Value;
		//id2Function.clear();
		id2Value.clear();
		fptr.open("id2names.log");
		mCallGraph = new Graph();
		while(1)
		{
			tokens.clear();
			UtilityFunctions::getNextTokens(fptr, tokens);
			if(fptr.eof())
				break;
			src = UtilityFunctions::convToUInt(tokens[0]);

			cerr << "Id "<<src<< " name #"<<tokens[1]<<"#\n";
			//Function* F = dyn_cast<Constant>(mModule->getOrInsertFunction(tokens[1], (const FunctionType*)0));
			//assert(!NOTFOUND(mName2Function, tokens[1]));
			assert(!NOTFOUND(mName2LLVMVal, tokens[1]));
			//Function* F = mName2Function[tokens[1]];
			Value* F = mName2LLVMVal[tokens[1]];
			assert(F);
			cerr << "Creating node "<< src<< " Function :" << F->getName() << endl;
			Node* X = mCallGraph->createNode(F);
			X->setLLVMId(src);
			//id2Function[src] = F;
			id2Value[src] = F;
		}
		fptr.close();
		tokens.clear();

        cerr << "THe size of callGraph is : " << mCallGraph->getNodes().size() << endl;

//		fptr.open("call_profile.log");
		fptr.open("call_profile_by.log");
		assert(fptr.is_open());
		map<uint64_t, Node*> id2Node;
		Graph* mCG = new Graph();
		while(1)
		{
			tokens.clear();
			UtilityFunctions::getNextTokens(fptr, tokens);
			if(fptr.eof())
				break;
			
//			assert(tokens.size() >= 2);
			assert(tokens.size() >= 3);
			src = UtilityFunctions::convToUInt(tokens[0]);
			callSite = UtilityFunctions::convToUInt(tokens[1]);
			//assert(!NOTFOUND(id2Function, src));
			assert(!NOTFOUND(id2Value, src));

			uint64_t key = (((uint64_t)src) << 32 )  | ((uint64_t)callSite);
			
			Node* n1 = mCG->createNode(id2Value[src]->getName()+callsite);
			id2Node[key] = n1;
						
			for(unsigned j=2;j<tokens.size();++j)	
			{
				dst = UtilityFunctions::convToUInt(tokens[j]);
				//assert(!NOTFOUND(id2Function, dst));
				assert(!NOTFOUND(id2Value, dst));
				//mCallSite2Functions[key].push_back(id2Function[dst]);
				//mCallSite2Functions[key].push_back(id2Value[dst]);
				cerr << "callsite:" << hex <<  key << dec << " -> "<< dst << endl;
				//Edge* e = mCallGraph->createEdge(id2Function[src], id2Function[dst]);
				Edge* e = mCallGraph->createEdge(id2Value[src], id2Value[dst]);

				//Bo add:
				j++;
				unsigned invokeTimes = UtilityFunctions::convToUInt(tokens[j]);                
				e->setWeightBY((double)invokeTimes);
			}
			//cerr << "Adding edge from "<<src<<" to "<<dst<<endl;
		}
		fptr.close();
		tokens.clear();
		//id2Function.clear();
		id2Value.clear();

		mCallGraph->dumpDot("dot_callgraph");
		//string command = "dot -Tpng graphs/dot_callgraph.dot > images/callgraph.png";
		//system(command.c_str());

		//cerr << "Dumped dot file\n";
		assert(!mCallGraph->testForCycles() && "Thanks for thinking I can handle recursion!");
		//cerr << "Checked for cycles\n";

		mCallGraph->buildNearestDominatorMatrix(mDomMatrix);

        cerr << "THe size of callGraph is : " << mCallGraph->getNodes().size() << endl;
	}
/*
	void GraphBuilder::blockCounters(string blk_counters_file)
	{
		ifstream fptr;
		fptr.open(blk_counters_file.c_str());

		if(!fptr.is_open())
		{
			cerr << "Could not open file \""<<blk_counters_file<<"\"\n";
			assert(0);
		}

		unsigned src, dst;
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
		
			//cerr << "Block "<<mBlkCounters.size()<< " count "<<dst<<endl;	
			mBlkCounters.push_back(dst);
		}
		tokens.clear();
		fptr.close();
	}
*/

	void GraphBuilder::annotateEdgeWeights(string filename, bool getIterDistances)
	{
		ifstream fptr;
		fptr.open(filename.c_str());

		if(!fptr.is_open())
		{
			cerr << "Could not open file \""<<filename<<"\"\n";
			assert(0);
		}

        cerr << "StoreInstId2NodeId content:" << endl;
        for (int i = 1; i < mStoreInstId2NodeId.size(); i++)
        {
            cerr << "the " << i << " th Store instruction is :" << endl;
            mId2Node[mStoreInstId2NodeId[i]]->getLLVMValue()->print(cerr);            
        }
        cerr << "LoadInstId2NodeId content:" << endl;
        for (int i = 1; i < mLoadInstId2NodeId.size(); i++)
        {
            cerr << "the " << i << " th Load instruction is :" << endl;
            mId2Node[mLoadInstId2NodeId[i]]->getLLVMValue()->print(cerr);
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

            cerr << "src : " << src << "; dst : " << dst << endl;  
            cerr << "StoreInstId2NodeId.size() : " << mStoreInstId2NodeId.size() 
                 << "; mLoadInstId2NodeId.size() : " << mLoadInstId2NodeId.size() << endl;  
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
		if(F->getName() == "main")
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
		Function::iterator I = F->begin();
		Function::iterator E = F->end();

		Graph* cdfg = new Graph();
		for (; I != E; ++I)
		{
//			assert(blkId < mBlkCounters.size());
			Node* currNode = cdfg->createNode(&(*I));
//			currNode->setNumDynamicInstances(mBlkCounters[blkId]);
			currNode->setLLVMId(blkId++);
		}
		I = F->begin();
		E = F->end();

		LoopDataStructure loopDataStructure;
		loopDataStructure.runOnFunction(F, loopInfo);
		vector<BasicBlock*> predBlks;
		for (; I != E; ++I)
		{
			predBlks.clear();
			UtilityFunctions::getPredecessorBlks(&(*I), predBlks);
			for(unsigned i=0;i<predBlks.size();++i)
			{
				Edge* e = cdfg->createEdge(predBlks[i], &(*I));
				if(loopDataStructure.isBackEdge(predBlks[i], &(*I)))
                {                    
					e->markBackEdge(true);
                    /*
                    //if(NOTFOUND(mHeader2LoopId, &(*I)))
                    {
                        mHeader2LoopId[&(*I)] = mLoopId;
                        mLoopId2Header[mLoopId] = &(*I);
                        mLoopId++;
                    }
                    mLoopId2Branch[mHeader2LoopId[&(*I)]].push_back(predBlks[i]); 
                    */
                }
			}            
		}

        cerr << "##### before cdfg topoSort\n";
	//	cdfg->topoSort(true);
		mFunction2CFG[F] = cdfg;
		predBlks.clear();

        cerr << "##### after cdfg topoSort\n";
        map<Loop*, LoopData>::iterator ldBegin = loopDataStructure.begin();
        map<Loop*, LoopData>::iterator ldEnd = loopDataStructure.end();

        for (; ldBegin != ldEnd; ldBegin++)
        {
            Loop* loop = (*ldBegin).first;
            LoopData loopData = (*ldBegin).second;
            
//            mLoopId2Loop[mLoopId] = loop;
            mLoopId2Header[mLoopId] = loop->getHeader();
            assert(NOTFOUND(mHeader2LoopId, loop->getHeader()) &&"!!! Two loops have the same basic block header!!!!\n");
            mHeader2LoopId[loop->getHeader()] = mLoopId;
            set<pair<BasicBlock*,BasicBlock*> >::iterator backEdgesBegin = loopData.mBackEdges.begin();
            set<pair<BasicBlock*,BasicBlock*> >::iterator backEdgesEnd = loopData.mBackEdges.end();
            for (; backEdgesBegin != backEdgesEnd; backEdgesBegin++)
            {
                assert((*backEdgesBegin).second == mLoopId2Header[mLoopId]);
                mLoopId2Branch[mLoopId].push_back((*backEdgesBegin).first);
                mLoopId2BRInst[mLoopId].push_back(((*backEdgesBegin).first)->getTerminator());
            }

            for(BasicBlock::iterator II = loop->getHeader()->begin(), IE = loop->getHeader()->end();
                    II != IE; ++II)
            {
                PHINode* PN = dyn_cast<PHINode>(&(*II));
                if(PN)
                {   
                    mLoopId2HeaderPHI[mLoopId] = PN;
                }
            }
/*
            set<pair<Instruction*, Instruction*> >::iterator backDataEdgeB = loopData.mBackDataEdges.begin();
            set<pair<Instruction*, Instruction*> >::iterator backDataEdgeE = loopData.mBackDataEdges.end();
            for (; backDataEdgeB != backDataEdgeE; backDataEdgeB++)
            {
                assert((*backDataEdgeB).second == mLoopId2HeaderPHI[mLoopId]);
                mLoopId2BRInst[mLoopId].push_back((*backDataEdgeB).first);
            }
*/
            std::vector<Value*> argVec;
            argVec.clear();
            argVec.push_back(ConstantInt::get(FB_TYPE, mLoopId, false));

            BasicBlock* header = loop->getHeader();
            assert(header);
            vector<BasicBlock*> predBlks;
            predBlks.clear();
            UtilityFunctions::getPredecessorBlks(header, predBlks);
            for(unsigned i=0;i<predBlks.size();++i)
            {
                BasicBlock* predBlk = predBlks[i];
                if(!(loop->contains(predBlk)))
                {
                    TerminatorInst* tInst = predBlk->getTerminator();
                    CallInst* loopFCall = new CallInst(mEnterLoopF, &(argVec[0]), &(argVec[1]), "", tInst);
                    mIgnoreSet.insert(loopFCall);
                }
            }
            mLoopId++;
        }

		loopDataStructure.clear();
        //added to obtain the loop information data
        
	}
}

