## Using GHCI

Just call `ghci` from the command line to open a REPL.

The prompt name is set to whichever module was last imported into the scope. Normally this will be `Prelude`, Haskell's standard library.

You can also reset the modules in scope with the command `:m` (or `:module`) with no arguments.

### GHCI commands

Commands are prepended with `:`, e.g. `:q`, `:reload`.

You can use external shell commands with `:!`, e.g. `:!cls` (clears screen on Windows)

Load packages into the REPL with `:l`, e.g. `:l functions.hs`.

## Concepts

Everything in Haskell is an expression or a declaration. Expressions can be literals or operations. Declarations name expressions. Haskell programs are nothing but large expressions comprising smaller ones.

## Whitespace

...is significant. Make sure parts of expressions are indented underneath the start of each, e.g.

```haskell
foo x = 
    let y = x * 2
        z = x ^ 2
    in 2 * y * z
```

## Functions

Functions are simply expressions that have arguments applied. Haskell functions are essentially partially applied: every argument passed creates a new curried function, e.g.

```haskell
partialApplication x y z = x + y + z
s1 = partialApplication 1
s2 = partialApplication 2
s3 = partialApplication 3
s3 -- emits '6'
```

Haskell functions are generally called in the prefix style -

```haskell
div 12 4
truncate "Hello, world" 5
```

Whereas operators are functions called in the infix style -

```haskell
4 + 6
"hello " ++ "world"
```

But non-operator functions can be called in an infix style using ` characters -

```haskell
12 `div` 4
"Hello, world" `truncate` 5
```

And you can use the infix operators in a prefix fashion by wrapping them in parens -

```haskell
(+) 10 6
(*) 3 4
(+3) 7
```

### :info

You can query the signature and prefix / infix nature of a function on the REPL using `:info` (e.g. `:info div` or `:info \`)

For instance, `:info *` -

```
class Num a where
  ...
  (*) :: a -> a -> a
  ...
        -- Defined in `GHC.Num'
infixl 7 *
```

Means that * is an infix operator, with left associativity, applied with level 7 precedence (0-9, higher comes earlier).

### Parens and the $ operator

When operator precedence is in doubt, you can of course always wrap values in parentheses.

```haskell
(+1) (2 * 3)
```

You can also use the `$` operator

```haskell
(+1) $ 2 * 3
```

How does this work? Well, `$` is defined as

```haskell
f $ x = f x
```

Which means anything to the right of `$` gets treated as a single parameter to the left-hand function (essentially enforcing right-hand associativity)

### Evaluation

A lot of Haskell literature uses the term 'reduction' to talk about evaluation - essentially like the mathematical reduction of functions. Once expressions are fully reduced, they are in a 'canonical' or 'normal' form:

```haskell
foo = triple 3  -- not reduced
foo = 3 * 3     -- reduce x1
foo = 9         -- reduced to normal form
```

Haskell, being a lazy language, doesn't reduce all expressions to normal form by default. Instead it tries to reduce to *weak head normal form* (such that only the outer constructor of the expression is evaluated)

## Some syntax basics

`::` == 'has the type signature'

## Operator-functions

All Haskell operators are just functions called in the infix style.

`++` concatenate
