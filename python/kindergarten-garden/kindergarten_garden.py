TRANSLATOR = {p[0]: p for p in ["Grass", "Clover", "Radishes", "Violets"]}
STUDENTS = [
    "Alice",
    "Bob",
    "Charlie",
    "David",
    "Eve",
    "Fred",
    "Ginny",
    "Harriet",
    "Ileana",
    "Joseph",
    "Kincaid",
    "Larry",
]


class Garden:
    def __init__(self, diagram, students=None):
        students = students or STUDENTS
        self.students = sorted(students)
        self.rows = diagram.split()

    def plants(self, student):
        i = self.students.index(student)
        return [
            TRANSLATOR[element]
            for row in self.rows
            for element in row[2 * i : 2 * i + 2]
        ]
