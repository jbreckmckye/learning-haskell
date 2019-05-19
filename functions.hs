double  x   =  x + x
-- [1] [2] [3] [ 4 ]
-- [1] name of function declaration. Must always begin lowercase.
-- [2] parameters
-- [3] declaration operator
-- [4] expression

doubleUs a b = double a + double b

-- if/thens are essentially just ternary expressions
biggify x =
    if x < 100
        then (x*2) + 100
        else x

ensmallen x = if x < 10 then x else ensmallen (x / 2)

-- recursion
fib x =
    if x < 2
        then if x == 1 then 1 else 0
        else fib (x - 1) + fib (x - 2)

-- Note that appending to a list generally requires traversing the whole array
sarcastify myStr = myStr ++ " ...NOT!!!"

-- Whereas prepending to a list is typically n(1)
prependSeven someNums = 7 : someNums

secondLetter myStr = head (tail myStr)

-- Haskell functions are always partially applied
-- (you can test this with the function below in the REPL)
partialApplication a b c = a + b + c

-- 'let' in functions allows us define subparts of expressions ahead-of-time
-- much like vars will do inside a pure function in other languages
foo x = 
    let y = x * 2
        z = x ^ 2
    in 2 * y * z

duplicateEach :: [Int] -> Int -> [Int]
duplicateEach inputs multiplier 
    = concat (map (replicate multiplier) inputs)
