#include "llvm/BasicBlock.h"
#include "llvm/Constants.h"
#include "llvm/DerivedTypes.h"
#include "llvm/GlobalVariable.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/CallSite.h"
#include "llvm/Instructions.h"

#include "llvm/Support/Debug.h"
#include "llvm/Pass.h"
/*#include "llvm/Use.h"*/
#include "llvm/Function.h"
#include "llvm/Module.h"
#include "llvm/Support/InstVisitor.h"
#include "llvm/Support/Casting.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/MemoryDependenceAnalysis.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/Analysis/PostDominators.h"

#include "llvm/Support/InstIterator.h"
#include "llvm/Transforms/IPO.h"

#include "llvm/Analysis/ProfileInfoLoader.h"
#include "llvm/Transforms/Utils/FunctionUtils.h"
#include "llvm/Transforms/Utils/Cloning.h"

