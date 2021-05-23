package luhn

import (
	"strconv"
)

func Valid(input string) bool {

	if len(input) <= 1 {
		return false
	}

	var sum int
	var chars int
	for _, c := range reverse(input) {
		if c == ' ' {
			continue
		}

		chars++
		v, err := strconv.Atoi(string(c))
		if err != nil {
			return false
		}

		if chars%2 == 0 {
			sum += double(v)
			continue
		}
		sum += v
	}

	if chars <= 1 {
		return false
	}

	return sum%10 == 0
}

func double(in int) int {
	double := in * 2
	if double < 9 {
		return double
	}
	return double - 9
}

func reverse(s string) string {
	runes := []rune(s)
	for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
		runes[i], runes[j] = runes[j], runes[i]
	}
	return string(runes)
}
