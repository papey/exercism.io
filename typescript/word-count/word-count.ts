export function count(sentence: string): Map<string, number> {
  return sentence
    .trim()
    .split(/[\t\s\n]+/)
    .map((word) => word.toLocaleLowerCase())
    .reduce((map, current) => {
      return map.set(current, map.get(current) + 1 || 1);
    }, new Map());
}
