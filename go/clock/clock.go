package clock

import "fmt"

// Clock is a struct representing clock timer in minutes
type Clock struct {
	m int
}

const (
	hoursPerDay = 24
	minsPerHour = 60
	minsPerDay  = minsPerHour * hoursPerDay
)

// New inits a clock struct
func New(h, m int) Clock {
	m += h * minsPerHour
	m %= minsPerDay

	// if time wrap in the past, loop
	if m < 0 {
		m += minsPerDay
	}
	return Clock{m}
}

func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c.m/minsPerHour, c.m%minsPerHour)
}

// Add minutes to a clock
func (c Clock) Add(minutes int) Clock {
	return New(0, c.m+minutes)
}

// Subtract minutes to a clock
func (c Clock) Subtract(minutes int) Clock {
	return New(0, c.m-minutes)
}
