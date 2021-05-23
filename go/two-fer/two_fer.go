package twofer

import "fmt"

// ShareWith returns solution for two-fer
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}
