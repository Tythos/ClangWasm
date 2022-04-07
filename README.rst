SchellGL
========

Transcription of excellent work done by Schell:

  https://schellcode.github.io/webassembly-without-emscripten
  
* "Getting LLVM": Install LLVM from official release; this provides clang.exe and wasm-ld.exe. Assert the path of these binary executables matches the path define by %LLVM_ROOT% in the batch files.

* "Getting System Libraries": Clone the repository git@github.com:emscripten-core/emscripten.git into the same directory as this project (that is, ClangWasm and emscripten should be siblings). Assert that the relative path to the "system" folder from each numbered build project is "../../emscripten/system".

* "Getting wasm-opt": Clone the repository git@github.com:WebAssembly/binaryen.git into the same directory as this project (that is, ClangWasm and binaryen should be siblings). Run the build process for your particular compiler and system (I used MSVC on Windows, in which case the binary executables were created in "build/bin"). Assert that the relative path to the binary executable folder is "../../binaryen/build/bin".

* "Getting GNU Make": Ignore and run manually with scripts included here.

Objective here is to break apart Makefile contents and remove dependency on GNU Make executable. We also seek to break build process into batch script format for compile/link/clean steps. Some adjustments and streamlining to the HTML/JS load/execution process are also made.

Eventually we want to migrate towards a RequireJS-like (e.g., WasmThreads-style) approach where we can load and run WASM asynchronously and agnostically (with perhaps a module export manifest/configuration).

Notes for individual projects can be found in their respective README files.
