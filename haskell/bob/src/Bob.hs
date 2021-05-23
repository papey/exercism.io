module Bob (responseFor) where

import Data.Text as Text
import Data.Char as Char

containsAlpha :: Text -> Bool
containsAlpha txt = Text.any Char.isAlpha txt

responseFor :: Text -> String
responseFor xs | isEmpty                  = "Fine. Be that way!"
               | isShouting && isQuestion = "Calm down, I know what I'm doing!"
               | isQuestion               = "Sure."
               | isShouting               = "Whoa, chill out!"
               | otherwise                = "Whatever."
               where
                   isQuestion = Text.last (Text.stripEnd xs) == '?'
                   isShouting = containsAlpha xs && Text.toUpper xs == xs
                   isEmpty    = Text.null $ Text.strip xs
