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

#ifndef GRAPHBUILDER_H
#define GRAPHBUILDER_H 1

#include "headers.h"
#include "llvm_headers.h"
#include "graph.h"

enum DepAnalysisType
{
	SIMPLE_DEP_ANALYSIS=0,
	PROPAGATE_DEP_ANALYSIS
};
/*
enum INSTTYPE
{
    INT_ALU=0,
    FP_ALU,
//  FP_ADD,
//  FP_MUL,
//  FP_DIV,
    LOAD,
    STOREADD,
    STOREDATA,
    OTHER
};
*/
namespace llvm
{
#define INT_ALU 0
#define FP_ALU 1
#define LOAD 2
#define STOREADD 3
#define STOREDATA 4
#define OTHER 5

#define FB_TYPE Type::Int32Ty
	class FunctionCalleeIdStruct
	{
		public:
			FunctionCalleeIdStruct() { clear(); }
			void clear();
		private:
			Function* mFunction;		
			vector<unsigned> mCalleeIdVector;
	};

	class CallSiteProfileStruct
	{
		public:
			CallSiteProfileStruct() { clear(); }
			void addFunctionAndCalleeId(Function* F, unsigned calleeId);
			void clear();
		private:
			vector<FunctionCalleeIdStruct> mCallSiteInfoVector;
	};

    class DriverGraphPass;
	/*class GraphBuilder : public ModulePass, public InstVisitor<GraphBuilder>*/
	class GraphBuilder : public InstVisitor<GraphBuilder>
	{
		public:
			GraphBuilder() { clear(); }

			void reset();
			void clear();

			bool doInitialization(Module& M);
//			bool runOnModule(Module &M, string dep_edge_filename, string blk_profile_name);
			//bool runOnModule(Module& M, DriverGraphPass* driverPass, string dep_edge_filename, string blk_profile_name);
			bool runOnModule(Module& M, DriverGraphPass* driverPass, string dep_edge_filename);
			//bool runSimplePass(Module& M, string dep_edge_filename, string blk_profile_name, 
			bool runSimplePass(Module& M, string dep_edge_filename,
					unsigned nodeType = NORMAL_NODE_TYPE);

			bool runOnFunction(Function &F, unsigned passId);
			bool runOnFunction(Function *F, unsigned passId);
			
			void runFirstPass(Function* F, unsigned nodeType = NORMAL_NODE_TYPE);
			void runSecondPass(Function* F);
            //added by Bo:
            void LoopLabeling(Loop*);	

			void runSimpleDepEdgesPass(Function* F);

			bool runCallGraphConstruction(Module& M);

			void buildDepEdges(Instruction& I);
			
			void visitBinaryOperator(BinaryOperator& BI);
			
			void visitGetElementPtrInst(GetElementPtrInst& GEP); 
			void visitLoadInst(LoadInst& LI);
			void visitStoreInst(StoreInst& SI);
			
			void visitReturnInst(ReturnInst& RI);
			void visitCallInst(CallInst& CI); 
			void visitPHINode(PHINode& PN);

			void visitCmpInst(CmpInst &I);

			void visitBranchInst(BranchInst &I);
			void visitSwitchInst(SwitchInst &I);
			void visitSelectInst(SelectInst& SI);

			void visitCastInst(CastInst& BI);
            
            void visitTerminatorInst(TerminatorInst &I);

			void visitInstruction(Instruction &I) 
			{
				cerr << "Instruction type "<<I.getOpcodeName() <<" unhandled\n";
			}
/*
			void CREATE_EDGE(Value* X, Value* Y);
			void CREATE_EDGE(Value* lPred, Node* Y);
*/	
            Edge* CREATE_EDGE(Value* X, Value* Y);
			Edge* CREATE_EDGE(Value* lPred, Node* Y);

			void addCalleeNodes(Graph* currGraph, Graph* calleeGraph, Function* calleeFunction, 
					Node* calleeNode, unsigned callSiteId);

			void annotateEdgeWeights(string filename, bool getIterDistances=false);
			void createCallGraph();
			void blockCounters(string filename);
			/*void callerProfile();*/
			/*void checkUnhandledInstructions(Instruction* I);*/

			static Function* getFunction(Value* v);
			static BasicBlock* getBasicBlock(Node* X);

			bool isExternallyVisible(Node* n, Function* F);	
			void createEdgesFromStoreNode(Node* origNode, Node* currNewNode, 
					unsigned depComplexity = PROPAGATE_DEP_ANALYSIS);

			Graph* getGraph(Function* F)
			{
				assert(!NOTFOUND(mFunction2Graph, F));
				return mFunction2Graph[F];
			}
			Graph* getCFG(Function* F)
			{
				assert(!NOTFOUND(mFunction2CFG, F));
				return mFunction2CFG[F];
			}
			void runJohnsonOnly(unsigned numNodes);
			
			//build CFG
			void buildCFG(Function* F, LoopInfo* loopInfo, unsigned& blkId);
            void updateLoopILP(Loop* lp);
            void calculateBlkILP(BasicBlock*, unsigned);
		private:
            DriverGraphPass* mDriverPass;
			Module* mModule;
			Graph* mGraph;
			Graph* mCFG;
			AliasAnalysis* mAliasAnalysis;

			map<Function*, Graph*> mFunction2Graph;
			map<Function*, Graph*> mFunction2CFG;

			map<Value*, Node*> mLLVM2Node;
			vector<Node*> mLoadVector;
			vector<Node*> mStoreVector;

			Function* mCurrentPropFunction;

			vector<Node*> mId2Node;
			vector<unsigned> mBlkCounters;

			unsigned mNodeId;
			unsigned mBlkId;
			unsigned mFunctionId;
			unsigned mCallSiteId;
		
            unsigned mLoopId;

			Graph* mCallGraph;
			map<uint64_t, vector<Function*> > mCallSite2Functions;

			vector<unsigned> mLoadInstId2NodeId;
			vector<unsigned> mStoreInstId2NodeId;

			set<Node*> mDuplicatedNodes;

			vector<vector<Node*> > mDomMatrix;

			unsigned mDepComplexity;

			map<string, Function*> mName2Function;
            map<string, Value*> mName2LLVMVal;

            vector<Function*> mFunctionVector;
            
            map<BasicBlock*, unsigned> mHeader2LoopId;
            map<unsigned, BasicBlock*> mLoopId2Header;
            map<unsigned, Instruction*> mLoopId2HeaderPHI;
            map<unsigned, vector<BasicBlock*> > mLoopId2Branch;
            map<unsigned, vector<Instruction*> > mLoopId2BRInst;
            set<Instruction*> mIgnoreSet;
            Function* mEnterLoopF;
            Function* mEnterFuncF;
            unsigned mTotalFunctions;
            map<unsigned, unsigned> mXeonPorts;
            map<unsigned, unsigned> mAtomPorts;
            map<unsigned, unsigned> mBlkId2NumInst;
            map<unsigned, int> mBlkId2XeonCycle;
            map<unsigned, int> mBlkId2AtomCycle;
            map<unsigned, unsigned> mNodeId2InstType;
	};
}

#endif
