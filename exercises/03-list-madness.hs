-- Find the last element in a list (recursive)
final :: [a] -> a
final [] = error "Input list is empty"
final [x] = x
final (x:xs) = final xs

-- Get Nth element of a list
getElement :: [a] -> Int -> a
getElement [] _ = error "Input list is empty"
getElement (x:xs) 1 = x
getElement (x:xs) n 
    | n < 1 = error "Index zero or negative"
    | n > length (x:xs) = error "Index out of bounds"
    | otherwise = getElement xs (n-1)