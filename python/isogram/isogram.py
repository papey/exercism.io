def is_isogram(string):
    sanitize = [x.lower() for x in string if x.isalpha()]
    return len(sanitize) == len(set(sanitize))
