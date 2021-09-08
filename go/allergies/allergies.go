package allergies

const (
	eggs = 1 << iota
	peanuts
	shellfish
	strawberries
	tomatoes
	chocolate
	pollen
	cats
)

// Allergy indentify an allergy using an int code
type Allergy uint

// Allergenic map Allergy code to allergenic name
type Allergenic struct {
	Name    string
	Allergy Allergy
}

var allergies = []Allergenic{
	{Name: "eggs", Allergy: eggs},
	{Name: "peanuts", Allergy: peanuts},
	{Name: "shellfish", Allergy: shellfish},
	{Name: "strawberries", Allergy: strawberries},
	{Name: "tomatoes", Allergy: tomatoes},
	{Name: "chocolate", Allergy: chocolate},
	{Name: "pollen", Allergy: pollen},
	{Name: "cats", Allergy: cats},
}

// Result wraps substance and alergic result together
type Result struct {
	substance string
	result    bool
}

// Allergies is used to list all allergiges of the subject using it's score
func Allergies(score uint) (result []string) {
	for _, a := range allergies {
		if score&uint(a.Allergy) == uint(a.Allergy) {
			result = append(result, a.Name)
		}
	}
	return result
}

// AllergicTo check if subject if allergic to a list of substances using it's score
func AllergicTo(score uint, test string) bool {
	for _, a := range allergies {
		if a.Name == test {
			return score&uint(a.Allergy) == uint(a.Allergy)
		}
	}
	return false
}
