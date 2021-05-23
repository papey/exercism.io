package robotname

import (
	"fmt"
	"math/rand"
)

// max names value
const max = 26 * 26 * 10 * 10 * 10

// keep track of used names
var used map[string]bool

// init used map on package init
func init() {
	used = make(map[string]bool)
}

// Robot is a basic robot struct
type Robot struct {
	// name will be init to ""
	name string
}

// Name will return name of the robot
func (r *Robot) Name() (name string, err error) {
	// if name is init value or reset value
	if r.name == "" {
		r.name, err = genName()
	}

	return r.name, err
}

// gen a random name if available
func genName() (string, error) {
	if max == len(used) {
		return "", fmt.Errorf("all %v names used", max)
	}

	digitLen := 3
	alphaLen := 2
	parts := make([]rune, digitLen+alphaLen)

	for {
		for i := 0; i < alphaLen; i++ {
			parts[i] = rune('A' + rand.Intn(26))
		}
		for i := alphaLen; i < digitLen+alphaLen; i++ {
			parts[i] = rune('0' + rand.Intn(10))
		}

		newName := string(parts)

		if found := used[newName]; !found {
			used[newName] = true
			return newName, nil
		}

	}
}

// Reset robot name
func (r *Robot) Reset() {
	r.name = ""
}
