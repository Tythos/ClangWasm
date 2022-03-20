SchellGL
========

Transcription of excellent work done by Schell:

  https://schellcode.github.io/webassembly-without-emscripten
  
* "Getting LLVM": Install LLVM from official release; this provides clang.exe and wasm-ld.exe

* "Getting System Libraries": Download release and extract System to "./deps/emscripten/"

* "Getting wasm-opt": Download release and extract wasm-opt.exe to "./deps/binaryen"

* "Getting GNU Make": Ignore and run manually with scripts included here

Objective here is to break apart Makefile contents and remove dependency on GNU Make executable.

We also seek to break build process into batch script format for compile/link/clean steps.

Some adjustments and streamlining of HTML/JS load/execution process is also made.

Eventually we want to migrate towards a RequireJS-like (e.g., WasmThreads-style) approach where we can load and run WASM asynchronously and agnostically (with perhaps a module export manifest/configuration).
