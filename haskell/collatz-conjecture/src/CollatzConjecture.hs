module CollatzConjecture (collatz) where

collatz' :: Integer -> Integer -> Integer
collatz' acc n | n == 1 = acc
               | even n = collatz' (acc + 1) (n `quot` 2)
               | odd n  = collatz' (acc + 1) (3 * n + 1)
               | otherwise = error "His this possible ?"

collatz :: Integer -> Maybe Integer
collatz n | n <= 0    = Nothing
          | otherwise = Just $ collatz' 0 n
