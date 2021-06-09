import sequtils, sugar

func sum*(n: int, factors: seq[int]): int =
  let validFactors = factors.filterIt(it != 0)
  toSeq(1..<n).filter(x => validFactors.anyIt(x mod it == 0)).foldl(a + b, 0)
