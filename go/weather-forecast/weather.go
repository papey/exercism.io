// Package weather computes and return the forcast for a given city
package weather

// CurrentCondition olds the value of the current weather condition
var CurrentCondition string

// CurrentLocation olds the value of the current weather location
var CurrentLocation string

// Forecast is used to format current forecast request
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
