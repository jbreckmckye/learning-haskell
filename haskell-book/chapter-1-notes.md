# Haskell book

## Chapter One

Haskell is based on lambda calculus. It's classed as a 'pure' functional programming language because it contains no features that cannot be translated into lambda expressions.

An expression is called referentially transparent if it can be replaced with its corresponding value without changing the program's behavior.

## Structure of lambda expressions

Expressions, variables, abstractions.

Expressions  := superset of all three
Variables    := names for function inputs
Abstractions := functions

   λ x . x
   -----      <- this is the HEAD
     -        <- param, [binds] any vars with the same name in the body
         -    <- body, expression the lambda returns when applied;
                 'x' is a 'bound variable' (i.e. is mapped from a
                 param by name)
                 
### Some lambda calculus concepts
                          
ALPHA EQUIVALENCE

Notice how
    λx.x
    λy.y
    λz.z
...all mean the same thing? That's alpha equivalence.

BETA REDUCTION

When we call a function with a param, we 1) substitute all bound variables with that param expression, and 2) eliminate the head of the abstraction (whose only function was to bind variables), i.e.

    λx. x
    (apply seven)
    λ7. 7
        7

This step-by-step substitution process is termed "beta reduction" in Lambda Calculus.

(These will all be basic ideas but important vocab to know when reading HS documentation, e.g. "weak head forms") 

FREE VARIABLES

Consider
    λx. xy
    
The x in the body is bound, but y is not. It is irreducible:

    λx. xy
    (apply three)
    λ3. 3y
    3y
    
The whole abstraction can be applied to a secondary argument to resolve the whole thing:

    (λx. xy)z
 -> (apply three)
 -> (λ3. 3y)z
 -> (3y)z
 -> (apply two)
 -> (3y)2
 -> (3 . 2)
 -> 6
 
(this helps explain how HS functions work in a partially applied style)

HANDLING MULTIPLE ARGUMENTS

Lambdas, in formal lambda calculus, don't take multiple parameters. Instead they just nest heads.

e.g for (in pseudocode) add = a + b

in lambdas it's

    λa.(λb. a+b)
    
Though mathematics resources sometimes use a shorthand like

    λab.a+b
    
(this book is a bit ponderous to begin)

EQUIVALENCE EXERCISES

λxy.xz    -> λmn.mz
λxy.xxy   -> λa.(λb.aab)
λxyz.zx   -> λtos.st

EVALUATION AS SIMPLIFICATION

The totally reduced (substituted) form of an expression is its _beta normal form_. When the root expression of a Haskell program is at beta normal form the program has finished.

COMBINATORS

A combinator is a lambda with no free variables. They just combine whatever arguments they're given. That is: every term in the body can be found in the head.

e.g. λx.x, λxy.x

(I was curious about the y combinator - resource here: https://medium.com/@ayanonagon/the-y-combinator-no-not-that-one-7268d8d9c46)

REDUCTION DIVERGENCE

Not all reducible lambdas reduce to normal form. They can 'diverge', such as in this example:

(λx.xx)(λx.xx)

When we try and reduce it:

-> (λx.xx)(λx.xx)
-> ((λx.xx) as x. xx)
-> ((λx.xx)(λx.xx))
-> (λx.xx)(λx.xx) === back where we started

This is called omega