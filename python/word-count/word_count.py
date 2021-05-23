import re
import string
from collections import Counter


def count_words(sentence):
    reduced_symbols = string.punctuation.replace("'", "")
    sanitize = re.sub(
        rf"[{reduced_symbols}]", "", re.sub("[_,]", " ", sentence.lower())
    )
    return Counter(x.strip("'") for x in sanitize.split())
