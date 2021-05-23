import strutils
import sequtils
import sugar

proc isIsogram*(word : string): bool =
  let letters = collect(newSeq):
    for x in @word:
      if isAlphaAscii(x):
        x.toLowerAscii()

  result = letters == letters.deduplicate
