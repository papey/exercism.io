export const toRna = (input) => {
  let mapping = new Map([
    ["C", "G"],
    ["G", "C"],
    ["T", "A"],
    ["A", "U"]
  ]);
  return input.split("").map((v) => mapping.get(v)).join("");
};
