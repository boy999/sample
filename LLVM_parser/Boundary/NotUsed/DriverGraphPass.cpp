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
        clear();

        mGraphBuilder = new GraphBuilder();

        //mGraphBuilder->runCallGraphConstruction(M);

        //mGraphBuilder->runSimplePass(M, "simple_pipe_profile_50000", "block_profile_loop_50000.log");

        mGraphBuilder->runOnModule(M, this, "simple_pipe_profile_50000", "block_profile_loop_50000.log");

        //mGraphBuilder->runJohnsonOnly(40);

        return false;
    }	

    LoopInfo* DriverGraphPass::getLoopInfo(Function* F)
    {
        //cerr << "enter DriverGraphPass getLoopInfo!\n";	
        Function& ref = (*F);
        //cerr << "in the middle of DriverGraphPass getLoopInfo!\n";	
        return &(getAnalysis<LoopInfo>(ref)); 
        //cerr << "leave DriverGraphPass getLoopInfo!\n";	
    }
}
