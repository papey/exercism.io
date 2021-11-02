package birdwatcher

const dayPerWeek = 7

// TotalBirdCount return the total bird count by summing
// the individual day's counts.
func TotalBirdCount(birdsPerDay []int) (sum int) {
	for _, birds := range birdsPerDay {
		sum += birds
	}

	return sum
}

// BirdsInWeek returns the total bird count by summing
// only the items belonging to the given week.
func BirdsInWeek(birdsPerDay []int, week int) int {
	birdsForWeek := birdsPerDay[(week-1)*dayPerWeek : (week-1)*dayPerWeek+dayPerWeek]
	return TotalBirdCount(birdsForWeek)
}

// FixBirdCountLog returns the bird counts after correcting
// the bird counts for alternate days.
func FixBirdCountLog(birdsPerDay []int) []int {
	for i, birds := range birdsPerDay {
		if i%2 == 0 {
			birdsPerDay[i] = birds + 1
		}
	}

	return birdsPerDay
}
