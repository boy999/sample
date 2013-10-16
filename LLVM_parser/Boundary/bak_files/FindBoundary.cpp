#include "FindBoundary.h"
#include "UtilityFunctions.h"

using namespace llvm;

char FindBoundary::ID = 0;
static RegisterPass<FindBoundary> X0("find-boundary", "Find the boundaries of function calls and loops Pass");

namespace llvm
{
    bool FindBoundary::doInitialization(Module& M)
    {
        mEnterFuncF = M.getFunction("func_enter");
        assert(mEnterFuncF);
        mEnterLoopF = M.getFunction("loop_enter");
        assert(mEnterLoopF);


        mLoopId = 0;
        mFuncId = 0;
        mIgnoreSet.clear();
        mId2FunctionNames.open("id2names_BY.log",ios::out);

        Module::iterator mB = M.begin(), mE = M.end();

        for (;mB != mE; mB++)
        {   
            Function* F = &(*mB);            
            if (!F->isDeclaration())
            {
                mFunction2Id[F] = mFuncId;
                mId2FunctionNames << mFuncId<< " " << F->getName() <<endl;
                mFuncId++;
            }
        }

        return true;
    }

    bool FindBoundary::doFinalization(Module& M)
    {
        mId2FunctionNames.close();
        return true;
    }
/*
    bool FindBoundary::runOnModule(Module& M)
    {
        Module::iterator mB = M.begin(), mE = M.end();

        for (;mB != mE; mB++)
        {
            Function* F = &(*mB);
            
            mFunction2Id[F] = mFuncId;
            mId2FunctionNames << mFuncId<< " " << F->getName() <<endl;
            mFuncId++;
        }
        
        mB = M.begin();
        mE = M.end();
        for (;mB != mE; mB++)
        {
            Function* F = &(*mB);
//            if (!F->isDeclaration())
            {
//                if ((F != M.getFunction("func_enter")) && (F != M.getFunction("loop_enter")))
                runOnFunction(*F);
            }            
        }
        return true;
    }
*/
    bool FindBoundary::runOnFunction(Function& F)
    { 
        Function::iterator I;
        Function::iterator E; 

        I = F.begin();
        E = F.end();    

        for(; I != E;I++)
        {
            for (BasicBlock::iterator II = I->begin(), IE = I->end();
                    II != IE; ++II)
            {
                Instruction* currentI = &(*II);
                if(isa<CallInst>(currentI) && NOTFOUND(mIgnoreSet, currentI))
                {
                    CallInst* callI = dyn_cast<CallInst>(currentI);
                    assert(callI);
                    Function* FuncCalled = callI->getCalledFunction();

                    if (FuncCalled && (!NOTFOUND(mFunction2Id, FuncCalled)))
                    {
                        std::vector<Value*> argVec;
                        argVec.clear();
                        argVec.push_back(ConstantInt::get(FB_TYPE, mFunction2Id[FuncCalled], false));
                        CallInst* funcFCall = new CallInst(mEnterFuncF, &(argVec[0]), &(argVec[1]), "", currentI);
                        mIgnoreSet.insert(funcFCall);
                    }
                }
            }
        }

        findLoopEnter(); 

        return true;

    }

    void FindBoundary::findLoopEnter( )
    {
        LoopInfo* loopInfoPass = &(getAnalysis<LoopInfo>());
        LoopInfo::iterator lBegin = loopInfoPass->begin(), lEnd = loopInfoPass->end();
        for(;lBegin != lEnd;++lBegin)
        {
            std::vector<Value*> argVec;
            argVec.clear();
            argVec.push_back(ConstantInt::get(FB_TYPE, mLoopId, false));

            Loop* lp = *lBegin;
            BasicBlock* header = lp->getHeader();
            assert(header);
            vector<BasicBlock*> predBlks;
            predBlks.clear();
            UtilityFunctions::getPredecessorBlks(header, predBlks);
            for(unsigned i=0;i<predBlks.size();++i)
            {
                BasicBlock* predBlk = predBlks[i];
                if(!(lp->contains(predBlk)))
                {
                    TerminatorInst* tInst = predBlk->getTerminator();
                    CallInst* loopFCall = new CallInst(mEnterLoopF, &(argVec[0]), &(argVec[1]), "", tInst);
                    mIgnoreSet.insert(loopFCall);
                }
            }


//            Loop::block_iterator bBegin = lp->block_begin();
//            BasicBlock* bBlk = dyn_cast<BasicBlock>(*bBegin);
//            Instruction* firstInst = dyn_cast<Instruction>(bBlk->begin());
//            Instruction* firstInst = bBlk->getFirstNonPHI();

            mLoopId++;
        }
    }
}
