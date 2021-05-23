import sequtils

proc distance*(strandA : string, strandB : string): int =
    if len(strandA) != len(strandB):
        raise newException(ValueError, "Distance needs a strand of same length")

    result = zip(@strandA, @strandB).filterIt(it[0] != it[1]).len
