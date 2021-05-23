package isogram

import (
	"unicode"
)

// IsIsogram return true is input is an isogram, false otherwise
func IsIsogram(input string) bool {
	set := make(map[rune]bool)

	for _, c := range input {
		if !unicode.IsLetter(c) {
			continue
		}
		lower := unicode.ToLower(c)
		if set[lower] {
			return false
		}
		set[lower] = true
	}

	return true

}
