module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA = traverse convert

convert :: Char -> Either Char Char
convert x
    | x == 'G' = Right 'C'
    | x == 'C' = Right 'G'
    | x == 'T' = Right 'A'
    | x == 'A' = Right 'U'
    | otherwise = Left x
