-- Reverse an array of any type
rev :: [a] -> [a]
rev [] = []
rev array = [last array] ++ rev (init array)