-- Given a list of real ints 0..100
-- For each which is a multiple of three, print 'Fizz'
-- For each which is a multiple of five, print 'Buzz'
-- For each which is a multiple of five and three, print 'FizzBuzz'
-- Otherwise, print the number

fizzbuzz :: IO()
fizzbuzz = print $ map fizzbuzz' [1..100]

fizzbuzz' :: Int -> String
fizzbuzz' n | mod n 15 == 0   = "FizzBuzz"
            | mod n 5  == 0   = "Buzz"
            | mod n 3  == 0   = "Fizz"
            | otherwise       = show n