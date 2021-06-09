import sequtils

proc distance*(strandA, strandB : string): int =
    if len(strandA) != len(strandB):
        raise newException(ValueError, "Distance needs a strand of same length")

    result = zip(strandA, strandB).countIt(it[0] != it[1])
