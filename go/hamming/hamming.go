package hamming

import "fmt"

// Distance will compute hamming distance between to DNA strands
func Distance(a, b string) (int, error) {
	var diff int

	if len(a) != len(b) {
		return -1, fmt.Errorf("DNA strands lengths not equals")
	}

	for i := range a {
		if a[i] != b[i] {
			diff++
		}
	}

	return diff, nil
}
