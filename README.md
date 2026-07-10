# A sign extension optimization pass for LLVM

**Aggelos Gkogkosis**  
**Supervisor:** Polyvios Pratikakis  
Department of Computer Science, University of Crete, Heraklion, Crete, Greece

## Abstract

Most programs running on modern 64-bit architectures, use many narrow types internally. In C/C++ for example, this is common for several reasons: many programs were originally designed for 32-bit architectures, programmers habitually reach for types like 32-bit "int" that are narrower than the register width, and some data naturally fits in fewer bits, such as characters. The compiler must insert sign and zero extension instructions to keep values correct at the wider register width. These extensions are frequent and often survive into the final generated code, where they contribute to unnecessary overhead.

This thesis studies sign and zero extension optimizations in LLVM, using the algorithm of Kawahito et al. and adapting it to its SSA-based IR (Intermediate Representation) for the RISC-V RV64 target. The implementation follows the main phases of the original approach, including widening, extension insertion, elimination order determination, and redundant extension elimination.

Our experimental implementation of the approach in LLVM IR shows promising results. On average, the transformation reduces the dynamic instruction count by approximately 0.24% on the LLVM Test Suite and 0.14% on MiBench. In some benchmarks, the reduction is more noticeable, ranging from around 0.5% to 1.15%. These results provide some interesting insights into the application of the Kawahito et al. extension elimination approach in LLVM and highlight its potential to reduce extension-related overhead in certain cases.

## Repository Structure

- [src/](src/): implementation source files.
- [paper/](paper/): thesis paper source and generated PDF.

---

- This thesis submitted in partial fulfillment of the requirements for the Bachelor of Science degree in Computer Science.
- The work has been supported by the Foundation for Research and Technology - Hellas (FORTH), Institute of Computer Science (ICS).
