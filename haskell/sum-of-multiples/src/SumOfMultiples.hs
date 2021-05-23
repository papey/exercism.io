module SumOfMultiples (sumOfMultiples) where

import Data.Set (unions, fromList, Set, empty)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ unions $ map (multiples limit) $ filter (/=0) factors

multiples :: Integer -> Integer -> Set Integer
multiples limit e
    | e > 0 = fromList [e, 2*e..(limit-1)]
    | otherwise = empty
