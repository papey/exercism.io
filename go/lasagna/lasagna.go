package lasagna

// timeInOven represents how many time is needed to bake a lasagna
const timeInOven = 40

// timePerLayer represents how many time is needed to prepare a layer
const timePerLayer = 2

// OvenTime returns how many minutes the lasagna should be in the oven
func OvenTime() int {
	return timeInOven
}

// RemainingOvenTime returns how many minutes sill has to remain in the oven
func RemainingOvenTime(elasped int) int {
	return timeInOven - elasped
}

// PreparationTime computes how many time is needed to prepare the lasagna
func PreparationTime(layers int) int {
	return layers * timePerLayer
}

// ElapsedTime returns how many minutes in total you've work on the lasagna
func ElapsedTime(layers, elapsed int) int {
	return PreparationTime(layers) + elapsed
}
