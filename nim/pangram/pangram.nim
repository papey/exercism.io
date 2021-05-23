import unicode

func isPangram*(input: string): bool =
    let
         sanitized = unicode.toLower(input)
         alpha = {'a'..'z'}

    for ch in alpha:
        if ch notin sanitized:
            return false

    return true
