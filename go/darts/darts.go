package darts

// Score computes dart score base on x and y coordinates
func Score(x, y float64) int {
	rr := x*x + y*y

	switch {
	case rr <= 1:
		return 10
	case rr <= 25:
		return 5
	case rr <= 100:
		return 1
	default:
		return 0
	}
}
