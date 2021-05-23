from typing import DefaultDict


class School:
    def __init__(self):
        self.data = DefaultDict(set)

    def add_student(self, name, grade):
        self.data[grade].add(name)

    def roster(self):
        return [name for k in sorted(self.data.keys()) for name in sorted(self.data[k])]

    def grade(self, grade_number):
        return sorted(list(self.data[grade_number])) or []
