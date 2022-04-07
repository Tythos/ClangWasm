@echo off
REM Compiles main.c into main.o using clang's wasm target

REM CUSTOMIZE BY SPECIFYING VALUES FOR THE FOLLOWING VARIABLES
SET LLVM_ROOT=C:\Program Files\LLVM\bin

REM (redundant with BUILD=RELEASE)
SET DBGCFLAGS=-DNDEBUG

REM Global compiler flags
SET CCFLAGS=%DBGCFLAGS% -Ofast -std=c99

REM Global compiler flags for Wasm targeting
SET CLANGFLAGS=-target wasm32 -nostdinc
SET CLANGFLAGS=%CLANGFLAGS% -D__EMSCRIPTEN__ -D_LIBCPP_ABI_VERSION=2
SET CLANGFLAGS=%CLANGFLAGS% -fvisibility=hidden -fno-builtin -fno-exceptions -fno-threadsafe-statics

REM Compile main.c => main.o
SET CC="%LLVM_ROOT%\clang"
CALL :COMPILE main.o main.c %CC% %CCFLAGS%
EXIT /B %ERRORLEVEL%

REM Define "COMPILE" procedure
:COMPILE
    "%~3" %~4 %CLANGFLAGS% -MMD -MP -o %~1 -c %~2
EXIT /B 0
