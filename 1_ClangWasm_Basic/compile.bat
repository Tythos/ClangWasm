@echo off
REM Compiles main.c into main.o, based on the following original Makefile call:
REM     "@$3 $4 $(CLANGFLAGS) -MMD -MP -MF $(patsubst %.o,%.d,$1) -o $1 -c $2"
echo COMPILING main.c INTO main.o
clang -Ofast -std=c99 -target wasm32 -nostdinc -D__EMSCRIPTEN__ -D_LIBCPP_ABI_VERSION=2 -fvisibility=hidden -fno-builtin -fno-exceptions -fno-threadsafe-statics -MP -o main.o -c main.c
