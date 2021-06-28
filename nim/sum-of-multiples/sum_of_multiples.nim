import sequtils, sugar, math

func sum*(n: int, factors: seq[int]): int =
  toSeq(1..<n).filter(x => factors.anyIt(it != 0 and x mod it == 0)).sum
