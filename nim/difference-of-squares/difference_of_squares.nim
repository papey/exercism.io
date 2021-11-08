proc squareOfSum*(value: int): int =
    result = int(value * (value + 1) / 2)
    result = result * result

proc sumOfSquares*(value: int): int =
    result = int((value * (value + 1) * (2 * value + 1)) / 6)

proc difference*(input: int): int =
    result = squareOfSum(input) - sumOfSquares(input)
