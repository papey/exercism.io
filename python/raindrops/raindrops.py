def convert(number):
    mapping = {3: "Pling", 5: "Plang", 7: "Plong"}
    res = [value for key, value in mapping.items() if number % key == 0]

    return "".join(res) if res else str(number)
