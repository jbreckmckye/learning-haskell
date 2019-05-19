import Control.Monad
import Data.Foldable
import Data.List

type Tile = Int
type Line = [Tile]
type GameState = [Line]
type Solution = GameState

x = 0
puzzle = [
            [5, 3, x, x, 7, x, x, x, x],
            [6, x, x, 1, 9, 5, x, x, x],
            [x, 9, 8, x, x, x, x, 6, x],
            [8, x, x, x, 6, x, x, x, 3],
            [4, x, x, 8, x, 3, x, x, 1],
            [7, x, x, x, 2, x, x, x, 6],
            [x, 6, x, x, x, x, 2, 8, x],
            [x, x, x, 4, 1, 9, x, x, 5],
            [x, x, x, x, 8, x, x, 7, 9]
         ]

symbols = [1, 2, 3, 4, 5, 6, 7, 8, 9]

duplicateEach :: [Int] -> Int -> [Int]
duplicateEach inputs multiplier 
    = concat (map (replicate multiplier) inputs)

targetSymbols = duplicateEach symbols (length symbols)

solve :: GameState -> Maybe Solution
solve gameState
    | null freeSymbols = Just gameState
    | otherwise = msum solutions
    where solutions = map solve nextStates
          nextStates = validNextStates gameState nextSymbol
          nextSymbol = head mostCommon freeSymbols
          freeSymbols = findFreeSymbols gameState

findFreeSymbols :: GameState -> [Int]
findFreeSymbols gameState 
    = targetSymbols \\ concat gameState
