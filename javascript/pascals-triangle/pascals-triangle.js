const buildRow = (fromRow = []) =>
  Array.from(
    Array(fromRow.length + 1),
    (_, i) => fromRow[i - 1] + fromRow[i] || 1
  );

export const rows = (deepness, triangle = []) =>
  deepness
    ? rows(deepness - 1, [...triangle, buildRow(triangle[triangle.length - 1])])
    : triangle;
