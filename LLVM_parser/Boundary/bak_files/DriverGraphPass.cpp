#include "DriverGraphPass.h"

namespace llvm
{
	char DriverGraphPass::ID = 3;
	static RegisterPass<DriverGraphPass> DriverGraphPassX("graph-driver", "Tester pass for various graph construction/analysis");

	void DriverGraphPass::clear()
	{
		
	}	

	bool DriverGraphPass::runOnModule(Module& M)
	{
        cerr << "DriverGraphPass::runOnModule\n";
		clear();
		
        cerr << "before mGraphBuilder = new GraphBuilder();\n";
		mGraphBuilder = new GraphBuilder();

        cerr << "after mGraphBuilder = new GraphBuilder();\n";
		//mGraphBuilder->runCallGraphConstruction(M);

		//mGraphBuilder->runSimplePass(M, "simple_pipe_profile_50000", "block_profile_loop_50000.log");

		//mGraphBuilder->runOnModule(M, "simple_pipe_profile_50000", "block_profile_loop_50000.log");
		//mGraphBuilder->runOnModule(M, this, "simple_pipe_profile_50000", "block_profile_loop_50000.log");
		//mGraphBuilder->runOnModule(M, this, "LDSTDep_input.log", "block_profile_loop_50000.log");
		mGraphBuilder->runOnModule(M, this, "LDSTDep_input.log");
        /*
         * simple_pipe_profile_50000 provides the number of loads for a specific store of the same address
         * format: storeInst_id loadInst_id #ofLoads
         *
         * block_profile_loop_5000.log provides the number of iterations that the basic block has been executed
         * format: basicblock_id #ofIterations
         */
        //mGraphBuilder->runJohnsonOnly(40);

        return false;
    }
    LoopInfo* DriverGraphPass::getLoopInfo(Function* F)
    {       
//        cerr << "enter DriverGraphPass getLoopInfo!\n";
        Function& ref = (*F);
//        cerr << "in the middle of DriverGraphPass getLoopInfo!\n";
        return &(getAnalysis<LoopInfo>(ref));
//        cerr << "leave DriverGraphPass getLoopInfo!\n";
    } 
}
