//
// This is only a SKELETON file for the 'Bob' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const hey = (message) => {
  const trimed = message.trim();
  const isAlpha = trimed.match(/([a-z]|[A-Z])/)
  const isQuestion = trimed[trimed.length - 1] == "?"
  const isShouting = trimed.toUpperCase() == trimed

  if (isAlpha && isShouting && isQuestion) return "Calm down, I know what I'm doing!"
  if (isAlpha && isShouting) return "Whoa, chill out!"
  if (isQuestion) return "Sure."
  if (trimed == "") return "Fine. Be that way!"
  return "Whatever."
};
