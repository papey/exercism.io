export function find(haystack: number[], needle: number): number | never {
  let left = 0
  let right = haystack.length - 1
  let middle = 0

  while (left <= right) {
    middle = Math.floor((left + right) / 2)

    if (haystack[middle] > needle) {
      right = middle - 1
    }

    if (haystack[middle] < needle) {
      left = middle + 1
    }

    if (haystack[middle] == needle) {
      return middle
    }
  }

  throw Error("Value not in array")
}
