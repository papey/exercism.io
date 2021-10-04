package cars

const carsPerHour = 221.0
const minsPerHour = 60

// CalculateProductionRatePerHour for the assembly line, taking into account
// its success rate
func CalculateProductionRatePerHour(speed int) float64 {
	return float64(speed) * carsPerHour * successRate(speed)
}

// CalculateProductionRatePerMinute describes how many working items are
// produced by the assembly line every minute
func CalculateProductionRatePerMinute(speed int) int {
	return int(CalculateProductionRatePerHour(speed)) / minsPerHour
}

// successRate is used to calculate the ratio of an item being created without
// error for a given speed
func successRate(speed int) float64 {
	if speed == 0 {
		return 0
	}

	if speed <= 4 {
		return 1
	}

	if speed <= 8 {
		return 0.9
	}

	return 0.77
}
