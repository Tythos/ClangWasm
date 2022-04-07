@echo off
REM Removes all intermediate and final build products
IF EXIST *.o (
    del *.o
)
IF EXIST *.wasm (
    DEL *.wasm
)
IF EXIST *.d (
    DEL *.d
)
