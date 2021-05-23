def score(word):
    values = dict(
        [(v, 1) for v in "AEIOULNRST"]
        + [(v, 2) for v in "DG"]
        + [(v, 3) for v in "BCMP"]
        + [(v, 4) for v in "FHVWY"]
        + [("K", 5)]
        + [(v, 8) for v in "JX"]
        + [(v, 10) for v in "QZ"]
    )

    return sum(values[v] for v in word.upper())
