import tables, sequtils

const matching = {'{': '}', '[': ']', '(': ')'}.toTable
const closing = toSeq(matching.values)

proc isPaired*(sentence : string) : bool =
    var stack: seq[char]

    for c in sentence:
        if matching.hasKey(c):
            stack.add(c)

        if c in closing:
            if stack.len == 0:
                return false
            if c != matching[stack.pop()]:
                return false

    stack.len == 0
