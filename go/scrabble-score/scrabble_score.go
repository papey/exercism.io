package scrabble

import "strings"

// Score compute scrabble score for a given word
func Score(input string) (s int) {
	for _, c := range strings.ToLower(input) {
		switch c {
		case 'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't':
			s += 1
		case 'd', 'g':
			s += 2
		case 'b', 'c', 'm', 'p':
			s += 3
		case 'f', 'h', 'v', 'w', 'y':
			s += 4
		case 'k':
			s += 5
		case 'j', 'x':
			s += 8
		case 'q', 'z':
			s += 10
		}
	}

	return s
}
