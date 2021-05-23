module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = (divisible 4) && (not (divisible 100) || divisible 400)
    where divisible x = rem year x == 0
