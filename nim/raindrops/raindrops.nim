import strutils
import strformat
import sugar

func convert*(input: int): string =
    const
        factors = [
            (num: 3, value: "Pling"),
            (num: 5, value: "Plang"),
            (num: 7, value: "Plong"),
        ]

    let data = collect(newSeq):
        for factor in factors:
            if input mod factor.num == 0:
                factor.value

    result = if data.len > 0: data.join("") else: $input
