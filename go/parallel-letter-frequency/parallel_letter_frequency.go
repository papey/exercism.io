package letter

// FreqMap records the frequency of each rune in a given text.
type FreqMap map[rune]int

// Frequency counts the frequency of each rune in a given text and returns this
// data as a FreqMap.
func Frequency(s string) FreqMap {
	m := FreqMap{}
	for _, r := range s {
		m[r]++
	}
	return m
}

// ConcurrentFrequency counts the frequency of reach rune using concurrency
func ConcurrentFrequency(inputs []string) FreqMap {
	buffer := make(chan FreqMap)
	for _, text := range inputs {
		go func(s string) {
			buffer <- Frequency(s)
		}(text)
	}

	res := FreqMap{}
	for range inputs {
		for k, v := range <-buffer {
			res[k] += v
		}
	}

	return res
}
