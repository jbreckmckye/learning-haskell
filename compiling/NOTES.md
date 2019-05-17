## Compiling code

Call the compiler with `ghc` using command flag `o` to specify the name of the output file.

Example:

```
 ghc -o hello hello.hs
```

The file must have a function named `main`.

## What gets output?

- an executable, e.g. `hello.exe` on Windows
- a header / interface file `hello.hi`, used when hello is a dependency being linked
- an object code file `hello.o`

Note that the executable file is quite large - about 14mb on my Windows build - because by default all dependencies are linked statically. There is a compiler flag, `-dynamic`, that allows for dynamic linking (and thus smaller executables), but this comes with portability issues (as you might expect).