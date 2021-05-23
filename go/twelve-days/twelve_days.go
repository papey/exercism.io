package twelve

import (
	"fmt"
	"strings"
)

var days = []string{
	"first",
	"second",
	"third",
	"fourth",
	"fifth",
	"sixth",
	"seventh",
	"eighth",
	"ninth",
	"tenth",
	"eleventh",
	"twelfth",
}

var gifts = []string{
	"twelve Drummers Drumming, ",
	"eleven Pipers Piping, ",
	"ten Lords-a-Leaping, ",
	"nine Ladies Dancing, ",
	"eight Maids-a-Milking, ",
	"seven Swans-a-Swimming, ",
	"six Geese-a-Laying, ",
	"five Gold Rings, ",
	"four Calling Birds, ",
	"three French Hens, ",
	"two Turtle Doves, and ",
	"a Partridge in a Pear Tree.",
}

const template = "On the %s day of Christmas my true love gave to me: %s"

// Verse is used to a generate a single verse in the poem
func Verse(n int) string {
	return fmt.Sprintf(template, days[n-1], strings.Join(gifts[len(gifts)-n:], ""))
}

// Song will return the all song
func Song() (output string) {
	buffer := make([]string, len(days))
	for i := range days {
		buffer[i] = Verse(i + 1)
	}

	return strings.Join(buffer, "\n")
}
