import re


def abbreviate(words):
    return "".join([x[0] for x in re.findall("[A-Z]+[a-z']*|[a-z']+", words)]).upper()
