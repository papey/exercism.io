package raindrops

import (
	"fmt"
	"strconv"
)

func Convert(input int) (result string) {
	drops := []struct {
		Value int
		Key   string
	}{
		{3, "Pling"},
		{5, "Plang"},
		{7, "Plong"},
	}

	for _, drop := range drops {
		if (input % drop.Value) == 0 {
			result = fmt.Sprintf("%s%s", result, drop.Key)
		}
	}

	if result == "" {
		result = strconv.Itoa(input)
	}

	return result
}
