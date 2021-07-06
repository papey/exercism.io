from algorithm import sortedByIt
from sequtils import mapIt, filterIt

type Student = tuple[name: string, grade: int]

proc sort(students: seq[Student]): seq[Student] =
    students.sortedByIt((it.grade, it.name))


type
    School* = object
        students*: seq[Student]

proc roster*(school: School): seq[string] =
    school.students.sort.mapIt(it.name)

proc grade*(school: School, grade: int): seq[string] =
    school.students.filterIt(it.grade == grade).sort.mapIt(it.name)
