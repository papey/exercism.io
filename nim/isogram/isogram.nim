import strutils, sequtils, sugar

proc isIsogram*(word : string): bool =
  let letters = collect(newSeq):
    for x in word:
      if isAlphaAscii(x):
        x.toLowerAscii()

  result = len(letters) == len(letters.deduplicate)
