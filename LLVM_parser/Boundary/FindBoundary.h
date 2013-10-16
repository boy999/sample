#include "headers.h"
#include "llvm_headers.h"

namespace llvm
{
#define FB_TYPE Type::Int32Ty
//    class FindBoundary : public ModulePass 
    class FindBoundary : public FunctionPass 
    {
        public:
            static char ID;
//            FindBoundary() : ModulePass(&ID) { ; }
            FindBoundary() : FunctionPass(&ID) { ; }
            virtual bool doInitialization(Module& M);
            virtual bool doFinalization(Module& M);
//            virtual bool runOnModule(Module& M);
            virtual bool runOnFunction(Function& F);
            virtual void getAnalysisUsage(AnalysisUsage &AU) const
            {
                AU.addRequired<LoopInfo>();
            }
            void findLoopEnter();
            void findFuncEnter();
        private:
            Function* mEnterFuncF;
            Function* mEnterLoopF;
            unsigned mLoopId;
            unsigned mFuncId;
            set<Instruction*> mIgnoreSet;
            map<Function*, unsigned> mFunction2Id;
            ofstream mId2FunctionNames;
    };
}
