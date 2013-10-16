#ifndef DRIVER_GRAPH_PASS_H
#define DRIVER_GRAPH_PASS_H 1

#include "headers.h"
#include "llvm_headers.h"
#include <iostream>

#include "GraphBuilder.h"

/*#include "InstructionCounter.h"*/
/*#include "LoopIterationCounter.h"*/
/*#include "LoopProfiler.h"*/

using namespace llvm;


namespace llvm
{
	class DriverGraphPass : public ModulePass, public InstVisitor<DriverGraphPass>
	{
		public:
			static char ID; // Pass identification, replacement for typeid
			DriverGraphPass() : ModulePass((intptr_t)&ID) { clear(); }
			virtual bool runOnModule(Module& M);
			virtual const char* getPassName() const { return "DriverGraphPass"; }

			void clear();

			/*virtual bool runOnFunction(Function* F);*/

			virtual void getAnalysisUsage(AnalysisUsage &AU) const 
			{
				/*AU.addRequired<InstructionCounter>();*/
				AU.addRequired<LoopInfo>();
			}

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

			void visitInstruction(Instruction &I) 
			{
				cerr << "Instruction type "<<I.getOpcodeName() <<" unhandled\n";
			}

            LoopInfo* getLoopInfo(Function* F);	
		private:
			GraphBuilder* mGraphBuilder;
			Graph* mGraph;
	};
}


#endif
