#ifndef LLVM_TRANSFORMS_SCALAR_TYPEWIDENING_H
#define LLVM_TRANSFORMS_SCALAR_TYPEWIDENING_H

#include "llvm/IR/PassManager.h"

namespace llvm {

class TypeWideningPass : public PassInfoMixin<TypeWideningPass> {
public:
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
};

}

#endif
