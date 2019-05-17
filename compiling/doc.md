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