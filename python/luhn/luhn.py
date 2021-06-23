import re


def doubling(number):
    double = number * 2
    if double < 9:
        return double

    return double - 9


class Luhn:
    def __init__(self, card_num):
        self.sequence = card_num

    def valid(self):
        sanitized = self.sequence.replace(" ", "")
        if len(sanitized) <= 1:
            return False

        contains_alpha = re.compile(r"\D+")
        if contains_alpha.findall(sanitized):
            return False

        numbers = [int(x) for x in sanitized[::-1]]

        res = 0
        for index, number in enumerate(numbers):
            if (index + 1) % 2 == 0:
                res += doubling(number)
                continue

            res += number

        return res % 10 == 0
