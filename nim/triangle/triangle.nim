import sequtils, intsets

type Triangle = array[3, int]

proc isValid(sides : Triangle) : bool =
    if sides.anyIt(it <= 0):
        return false

    let a = sides[0]
    let b = sides[1]
    let c = sides[2]

    result = a <= b + c and b <= a + c and c <= a + b

proc isEquilateral*(sides : Triangle) : bool =
    result = isValid(sides) and sides.toIntSet.len == 1

proc isIsosceles*(sides : Triangle) : bool =
    result = isValid(sides) and sides.toIntSet.len <= 2

proc isScalene*(sides : Triangle) : bool =
    result = isValid(sides) and sides.toIntSet.len == 3
