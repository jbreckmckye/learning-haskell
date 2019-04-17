double x = x + x

doubleUs a b = double a + double b

addUp x y = x + y

biggify x =
    if x < 100
        then (x*2) + 100
        else x

ensmallen x = if x < 10 then x else ensmallen (x / 2)

fib x =
    if x < 2
        then if x == 1 then 1 else 0
        else fib (x - 1) + fib (x - 2)

symbolNamesCanInclude'Apostrophes = 6

lostNumbers = [36, 10, 59, 97]

-- Note that appending to a list generally requires traversing the whole array
sarcastify myStr = myStr ++ " ...NOT!!!"

-- Whereas prepending to a list is typically n(1)
prependSeven someNums = 7 : someNums

secondLetter myStr = head (tail myStr)