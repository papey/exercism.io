
func isLeapYear*(input: uint): bool =
    (input mod 4 == 0) and (input mod 100 != 0 or input mod 400 == 0)
