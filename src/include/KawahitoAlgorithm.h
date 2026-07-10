#ifndef LLVM_TRANSFORMS_SCALAR_KAWAHITOZEXTALGORITHM_H
#define LLVM_TRANSFORMS_SCALAR_KAWAHITOZEXTALGORITHM_H

#include "llvm/IR/PassManager.h"

namespace llvm {

class KawahitoZextAlgorithmPass
    : public PassInfoMixin<KawahitoZextAlgorithmPass> {
public:
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
};

} // namespace llvm

#endif
