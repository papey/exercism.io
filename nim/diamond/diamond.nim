import strutils

proc reverse(input: string): string =
    for s in input:
        result = s & result

proc diamond*(input: char): string =
    const start = 'A'
    let steps = ord(input) - ord(start)
    var lines = newSeq[string](steps * 2 + 1)

    for i in 0..steps:
        var half = " ".repeat(steps - i) & char(int(start) + int(i)) & " ".repeat(i)
        var line = half & half.reverse[1..^1]
        lines[i] = line
        lines[steps * 2 - i] = line

    lines.join("\n") & "\n"
