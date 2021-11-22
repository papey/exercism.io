import sequtils
import algorithm
import strutils

proc detectAnagrams*(word: string, candidates: seq[string]): seq[string] =
    let lowered = word.toLower
    let letters_pool = lowered.sorted
    result = candidates.filterIt(it.toLower != lowered and it.toLower.sorted == letters_pool)
