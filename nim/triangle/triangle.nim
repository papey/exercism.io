import sequtils, intsets

proc isValid(sides : array[3, int]) : bool =
    if sides.anyIt(it <= 0):
        return false

    let a = sides[0]
    let b = sides[1]
    let c = sides[2]

    result = a <= b + c and b <= a + c and c <= a + b

proc toSet(sides: array[3, int]) : IntSet =
    var uniqSides = initIntSet()
    for s in sides:
        uniqSides.incl(s)

    result = uniqSides

proc isEquilateral*(sides : array[3, int]) : bool =
    result = isValid(sides) and toSet(sides).len == 1

proc isIsosceles*(sides : array[3, int]) : bool =
    result = isValid(sides) and toSet(sides).len <= 2

proc isScalene*(sides : array[3, int]) : bool =
    result = isValid(sides) and toSet(sides).len == 3
