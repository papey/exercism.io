from collections import defaultdict


class School:
    def __init__(self):
        self.data = defaultdict(list)

    def add_student(self, name, grade):
        self.data[grade].append(name)

    def roster(self):
        return [name for k in sorted(self.data.keys()) for name in sorted(self.data[k])]

    def grade(self, grade_number):
        return sorted(self.data[grade_number])
