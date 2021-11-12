// for parsing a specific instruction
const INSTRUCTION_REGEX =
  /(plus|minus|multiplied by|divided by|cubed)(?:\s(-?\d+)(.*))?/;
// for capturing the first decimal value, used as init
const INIT_REGEX = /\s+(-?\d+)(.*)?/;
// for ensuring that sentence is valid
const SENTENCE_REGEX = /^What\s+is(.*)?\?$/;

const OPERATIONS: Record<string, (a: number, b: number) => number> = {
  plus: (a: number, b: number): number => a + b,
  minus: (a: number, b: number): number => a - b,
  "multiplied by": (a: number, b: number): number => a * b,
  "divided by": (a: number, b: number): number => a / b,
};

export const answer = (sentence: string): number => {
  // check if sentence looks like a valid one
  let matches = sentence.match(SENTENCE_REGEX);
  if (!matches) {
    throw new Error("Unknown operation");
  }

  let [_sentence, rawInstructions] = matches;

  // if no instructions it looks like a syntax error
  if (!rawInstructions) {
    throw new Error("Syntax error");
  }

  // look for the init value
  matches = rawInstructions.match(INIT_REGEX);
  if (!matches) {
    throw new Error("Syntax error");
  }

  let [_rawInstructions, rawInit, instructions] = matches;

  let result = Number.parseInt(rawInit);

  // reduce on all the instructions if any
  while (instructions && instructions != "") {
    let matches = instructions.match(INSTRUCTION_REGEX);
    if (!matches) {
      throw new Error("Syntax error");
    }

    const [_, operator, rawOperand, rest] = matches;

    if (operator == "cubed") {
      throw new Error("Unknown operation");
    }

    let apply = OPERATIONS[operator];
    if (!apply) {
      throw new Error("Syntax error");
    }

    let operand = Number.parseInt(rawOperand);
    if (!operand) {
      throw new Error("Syntax error");
    }

    result = apply(result, operand);
    instructions = rest;
  }

  return result;
};
