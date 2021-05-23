package grains

import (
	"fmt"
)

const min = 0
const max = 64

// Square returns how many grains were on a given square
func Square(input int) (uint64, error) {
	if input > max || input <= min {
		return 0, fmt.Errorf("error input %d is not between [%d,%d]", input, min, max)
	}

	return 1 << (input - 1), nil
}

// Total returns the total number of grains on the chessboard
func Total() uint64 {
	return 1<<64 - 1
}
