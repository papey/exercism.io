package allergies

var allergies = [8]string{"eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"}

// Result wraps substance and alergic result together
type Result struct {
	substance string
	result    bool
}

// Allergies is used to list all allergiges of the subject using it's score
func Allergies(score uint) (result []string) {
	for i, substance := range allergies {
		if (score >> i & 1) == 1 {
			result = append(result, substance)
		}
	}

	return result
}

// AllergicTo check if subject if allergic to a list of substances using it's score
func AllergicTo(score uint, test string) bool {
	for i, substance := range allergies {
		if substance == test {
			return (score >> i & 1) == 1
		}
	}

	return false
}
