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

const allergies = 8

// Allergy indentify an allergy using an int code
type Allergy uint

func (a Allergy) String() string {
	switch a {
	case eggs:
		return "eggs"
	case peanuts:
		return "peanuts"
	case shellfish:
		return "shellfish"
	case strawberries:
		return "strawberries"
	case tomatoes:
		return "tomatoes"
	case chocolate:
		return "chocolate"
	case pollen:
		return "pollen"
	case cats:
		return "cats"
	default:
		panic("unsupported allergy")
	}
}

// NewAllergy maps string to an allergy value
func NewAllergy(s string) Allergy {
	switch s {
	case "eggs":
		return eggs
	case "peanuts":
		return peanuts
	case "shellfish":
		return shellfish
	case "strawberries":
		return strawberries
	case "tomatoes":
		return tomatoes
	case "chocolate":
		return chocolate
	case "pollen":
		return pollen
	case "cats":
		return cats
	default:
		panic("unsupported allergy")
	}
}

// Result wraps substance and alergic result together
type Result struct {
	substance string
	result    bool
}

// Allergies is used to list all allergiges of the subject using it's score
func Allergies(score uint) (result []string) {
	for i := uint(0); i < allergies; i++ {
		if score&(1<<i) == (1 << i) {
			result = append(result, Allergy(1<<i).String())
		}
	}

	return result
}

// AllergicTo check if subject if allergic to a list of substances using it's score
func AllergicTo(score uint, test string) bool {
	a := NewAllergy(test)
	return score&uint(a) == uint(a)
}
