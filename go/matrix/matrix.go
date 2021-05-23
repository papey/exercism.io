package matrix

import (
	"fmt"
	"strconv"
	"strings"
)

// Matrix simple type
type Matrix [][]int

// New creates a new matrix
func New(input string) (m Matrix, err error) {
	nbItems := 0
	init := true

	lines := strings.Split(input, "\n")
	m = make([][]int, len(lines))

	// for all lines (ie cols)
	for i, line := range lines {
		// init cols
		numbers := strings.Split(strings.TrimSpace(line), " ")
		// check if row length is valid
		if !init {
			if len(numbers) != nbItems {
				// return early in case of error
				return nil, fmt.Errorf("invalid matrix input %v", input)
			}
		}

		init = false
		nbItems = len(numbers)
		// init rows
		m[i] = make([]int, nbItems)

		// for all numbers in that row
		for j, num := range numbers {
			v, err := strconv.Atoi(num)
			if err != nil {
				return nil, err
			}
			m[i][j] = v
		}
	}

	return m, err
}

// Rows return all rows in the matrix
func (m Matrix) Rows() [][]int {
	res := make([][]int, len(m))
	for i, col := range m {
		res[i] = make([]int, len(col))
		copy(res[i], m[i])
	}

	return res
}

// Cols return all cols in the matrix
func (m Matrix) Cols() [][]int {
	res := make([][]int, len(m[0]))
	for col := range m[0] {
		res[col] = make([]int, len(m))
		for row := range m {
			res[col][row] = m[row][col]
		}
	}

	return res
}

// Set a value in the matrix
func (m Matrix) Set(row, col, val int) (ok bool) {
	if ok = (col < len(m) && row < len(m[0]) && col >= 0 && row >= 0); ok {
		m[row][col] = val
	}

	return ok
}
