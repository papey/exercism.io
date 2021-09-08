// Fefine an action to do when a code is received
type action = (array: string[]) => string[];

// A wrapper for a common used action
function push(array: string[], value: string): string[] {
  array.push(value);
  return array;
}

const events: Map<number, action> = new Map([
  [0b00001, (array: string[]): string[] => push(array, "wink")],
  [0b00010, (array: string[]): string[] => push(array, "double blink")],
  [0b00100, (array: string[]): string[] => push(array, "close your eyes")],
  [0b01000, (array: string[]): string[] => push(array, "jump")],
  [0b10000, (array: string[]): string[] => array.reverse()],
]);

export function commands(code: number): string[] {
  let sequence: string[] = [];

  events.forEach((action, flag) => {
    if (code & flag) {
      sequence = action(sequence);
    }
  });

  return sequence;
}
