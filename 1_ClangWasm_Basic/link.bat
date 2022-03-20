@echo off
REM Links main.o into main.wasm, then optimizes into main.min.wasm, based on the following original Makefile calls:
REM     @$(LD) $(LDFLAGS) -o $@ $(OBJS)
REM     @"$(WASMOPT)" --legalize-js-interface $(WOPTFLAGS) $@ -o $@
echo LINKING main.o INTO main.wasm
wasm-ld -no-entry -allow-undefined -import-memory -export=__wasm_call_ctors -export=malloc -export=free -export=main -export=square -o main.wasm main.o
echo OPTIMIZING main.wasm INTO main.min.wasm
wasm-opt --legalize-js-interface -g -O0 main.wasm -o main.min.wasm
