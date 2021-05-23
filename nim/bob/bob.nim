import sequtils
import strutils

func hey*(sentence: string): string =
    let
        trimed = sentence.strip()
        isAlpha = sentence.any(strutils.isAlphaAscii)
        isShouting = strutils.toUpper(trimed) == trimed
        isSilence = trimed == ""
        isQuestion = not isSilence and trimed[^1] == '?'

    if isAlpha and isShouting and isQuestion:
        return "Calm down, I know what I'm doing!"

    if isQuestion:
        return "Sure."

    if isSilence:
        return "Fine. Be that way!"

    if isAlpha and isShouting:
        return "Whoa, chill out!"

    result = "Whatever."
