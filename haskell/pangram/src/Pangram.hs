module Pangram (isPangram) where

import Data.Char

isPangram :: String -> Bool
isPangram text = all (\x -> x `elem` entry) alphabet
                    where alphabet = ['a'..'z']
                          entry = map toLower text
