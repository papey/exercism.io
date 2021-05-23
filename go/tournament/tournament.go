package tournament

import (
	"fmt"
	"io"
	"io/ioutil"
	"sort"
	"strings"
)

type result struct {
	name string
	mp   int
	w    int
	d    int
	l    int
	p    int
}

type results map[string]*result

func (r results) exists(name string) bool {
	_, found := r[name]
	return found
}

func (r results) add(name string) {
	if r.exists(name) {
		return
	}

	r[name] = &result{name: name}
}

func (r results) win(name string) {
	r[name].mp++
	r[name].w++
	r[name].p += 3
}

func (r results) loss(name string) {
	r[name].mp++
	r[name].l++
}

func (r results) draw(t1 string, t2 string) {
	r[t1].d++
	r[t1].mp++
	r[t1].p++
	r[t2].d++
	r[t2].mp++
	r[t2].p++
}

func (r results) toArray() []result {
	results := make([]result, 0, len(r))

	for _, result := range r {
		results = append(results, *result)
	}

	return results
}

// Tally will represent results of a tournament
func Tally(input io.Reader, outpout io.Writer) error {

	raw, err := ioutil.ReadAll(input)
	if err != nil {
		return err
	}

	data, err := parseData(string(raw))
	if err != nil {
		return err
	}

	results := data.toArray()
	sort.Slice(results, func(i, j int) bool {
		if results[i].p == results[j].p {
			return results[i].name < results[j].name
		}
		return results[i].p > results[j].p
	})

	write(results, outpout)

	return nil
}

func parseData(input string) (results, error) {
	res := results{}

	for _, line := range strings.Split(string(input), "\n") {
		// trim line
		trimed := strings.TrimSpace(line)
		// continue if empty or comment
		if trimed == "" || strings.HasPrefix(trimed, "#") {
			continue
		}

		parts := strings.Split(line, ";")
		if len(parts) != 3 {
			return nil, fmt.Errorf("error parsing line %v", line)
		}

		result := parts[2]
		if !isResultValid(result) {
			return nil, fmt.Errorf("result %v is not valid", result)
		}

		n1 := parts[0]
		n2 := parts[1]
		res.add(n1)
		res.add(n2)

		switch result {
		case "win":
			res.win(n1)
			res.loss(n2)
		case "loss":
			res.loss(n1)
			res.win(n2)
		case "draw":
			res.draw(n1, n2)
		}

	}

	return res, nil

}

func isResultValid(result string) bool {
	for _, candidate := range []string{"draw", "win", "loss"} {
		if candidate == result {
			return true
		}
	}

	return false
}

func write(results []result, output io.Writer) error {

	_, err := fmt.Fprintf(output, "%-30s | %2s | %2s | %2s | %2s | %2s\n", "Team", "MP", "W", "D", "L", "P")
	if err != nil {
		return err
	}

	for _, res := range results {
		_, err := fmt.Fprintf(output, "%-30s | %2d | %2d | %2d | %2d | %2d\n", res.name, res.mp, res.w, res.d, res.l, res.p)
		if err != nil {
			return err
		}
	}

	return nil

}
