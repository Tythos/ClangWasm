@echo off
REM Compiles main.c into main.o using clang's wasm target

REM CUSTOMIZE BY SPECIFYING VALUES FOR THE FOLLOWING VARIABLES
SET LLVM_ROOT=C:\Program Files\LLVM\bin
SET WASMOPT=..\..\binaryen\build\bin\wasm-opt.exe

REM (redundant with BUILD=RELEASE)
SET WOPTFLAGS=-O3

REM Flags for wasm-ld (removed procedural parsing of %EXPORTS%)
SET LDFLAGS=-no-entry -allow-undefined -import-memory
SET LDFLAGS=%LDFLAGS% -export=__wasm_call_ctors -export=malloc -export=free -export=main
SET LDFLAGS=%LDFLAGS% -export=square

REM Link main.o => main.wasm
SET LD="%LLVM_ROOT%\wasm-ld"
%LD% %LDFLAGS% -o main.wasm main.o
"%WASMOPT%" --legalize-js-interface %WOPTFLAGS% main.wasm -o main.min.wasm
EXIT /B %ERRORLEVEL%
