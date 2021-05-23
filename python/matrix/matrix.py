class Matrix:
    def __init__(self, matrix_string):
        self.data = [[int(n) for n in l.split()] for l in matrix_string.splitlines()]

    def row(self, index):
        return self.data[index - 1]

    def column(self, index):
        return [x[index - 1] for x in self.data]
