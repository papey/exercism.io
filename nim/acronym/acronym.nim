import strutils, sequtils

proc abbreviate*(sentence: string): string =
    sentence.split({' ', '-', '_'}).filterIt(it != "").mapIt(it[0].toUpperAscii).join("")
