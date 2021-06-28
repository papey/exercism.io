package space

// Planet represent a planet name
type Planet string

const earthSecPerYear = 31557600

var fromPlanetRatio = map[Planet]float64{
	"Mercury": 0.2408467 * earthSecPerYear,
	"Venus":   0.61519726 * earthSecPerYear,
	"Earth":   1 * earthSecPerYear,
	"Mars":    1.8808158 * earthSecPerYear,
	"Jupiter": 11.862615 * earthSecPerYear,
	"Saturn":  29.447498 * earthSecPerYear,
	"Uranus":  84.016846 * earthSecPerYear,
	"Neptune": 164.79132 * earthSecPerYear,
}

// Age converts an age on earth to an age on the requested planet
func Age(seconds float64, p Planet) float64 {
	return seconds / fromPlanetRatio[p]
}
