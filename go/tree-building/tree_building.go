package tree

import (
	"fmt"
	"sort"
)

// Node represent a node in the tree
type Node struct {
	ID       int
	Children []*Node
}

// Record represent an entry in the tree
type Record struct {
	ID     int
	Parent int
}

// ByID is type used to sort records by ids
type ByID []Record

// Len of the array
func (r ByID) Len() int { return len(r) }

// Swap two items
func (r ByID) Swap(i, j int) { r[i], r[j] = r[j], r[i] }

// Less
func (r ByID) Less(i, j int) bool { return r[i].ID < r[j].ID }

// Build the tree using records
func Build(records []Record) (root *Node, err error) {
	if len(records) < 1 {
		return nil, nil
	}

	sort.Sort(ByID(records))

	if records[0].Parent != 0 {
		return nil, fmt.Errorf("root with ID 0 associated with child %v", records[0].Parent)
	}

	nodes := make([]*Node, len(records))

	for index, record := range records {
		if record.ID != index {
			return nil, fmt.Errorf("node ID %v and record index %v mismatch", record.ID, index)
		}

		if record.ID != 0 && record.Parent >= record.ID {
			return nil, fmt.Errorf("child %v can't be asscioated to parent %v", record.Parent, record.ID)
		}

		current := &Node{ID: record.ID, Children: nil}
		if record.ID != 0 {
			parent := nodes[record.Parent]
			parent.Children = append(parent.Children, current)
		}
		nodes[record.ID] = current
	}

	return nodes[0], nil
}
