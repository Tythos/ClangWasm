Basic
=====

After updating LLVM_ROOT and WASMOPT paths, the build process is a simple two-step::

  > compile.bat

  > link.bat

After which you can host the folder::

  > python -m http.server

And then point your browser to "http://localhost:8000/loader.html".
