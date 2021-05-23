module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromListWith)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

fromChar :: Char -> Either String (Nucleotide, Int)
fromChar c = case c of
    'A' -> Right (A, 1)
    'C' -> Right (C, 1)
    'G' -> Right (G, 1)
    'T' -> Right (T, 1)
    _   -> Left [c]

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts i = (fromListWith (+)) <$> traverse fromChar i
