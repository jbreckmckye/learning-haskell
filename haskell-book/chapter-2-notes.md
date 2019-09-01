# Chapter 2 notes

(A lot of this chapter is covered in NOTES.md)

Some operators:

+       plus
-       subtraction
*       multiplication
/       fractional div
div     integer div, rounds down
mod     modulo, always positive
quot    quotient, like div but rounds towards zero
rem     remainder after division

Negative numbers should be encased in parens (-4)

## let and where

Both of these keywords allow us to declare subcomponents in an expression, e.g.

```haskell
quadruple x = double $ double x
  where double y = y * 2
```

Or in the case of let:

```
cube x =
  let square x = x * x
  in x * square x
```

You can bind multiple expressions in both cases with line breaks / semicolons, e.g. `let x = 5; y = 10 in x * y` evaluates to `50`

or

```
let x = 5
    y = 10
in x * y
```

### What's the difference?

The most obvious is that lets come before the expression, wheres come after. But there are some more subtle distinctions...

**Let is an expression**

e.g. you can write `y = (let x = 5 in x * x)`

**Let has a limited (block) scope**

e.g. this won't compile

```
foo n =
  if x > 10
    let bar = 6 in x + bar
  else
    x + bar * 2
    -- 'bar' is undefined here!
```

But this will

```
foo n =
  if x > 10
    x + bar
  else
    x + bar * 2
      where bar = 6
```