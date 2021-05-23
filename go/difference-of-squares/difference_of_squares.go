package diffsquares

func SquareOfSum(n int) (res int) {
	sum := n * (n + 1) / 2
	return sum * sum
}

func SumOfSquares(n int) (res int) {
	return n * (n + 1) * (2*n + 1) / 6
}

func Difference(n int) int {
	nn := n * n
	return (3*nn + n + n) * (nn - 1) / 12
}
