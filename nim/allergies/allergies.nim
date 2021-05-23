import bitops, tables, sequtils

const items = {
    "eggs": 0,
    "peanuts": 1,
    "shellfish": 2,
    "strawberries": 3,
    "tomatoes": 4,
    "chocolate": 5,
    "pollen": 6,
    "cats": 7,
}.toOrderedTable

type
    Allergies* = object
        score*: uint

func isAllergicTo*(algs: Allergies, item: string): bool = algs.score.testBit(items[item])

func lst*(algs: Allergies): seq[string] = toSeq(items.keys).filterIt(algs.isAllergicTo(it))
