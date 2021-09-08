// Define an action to do when a code is received
type action = (array: string[]) => string[];

const events: Map<number, action> = new Map([
  [0b00001, (array: string[]): string[] => [...array, "wink"]],
  [0b00010, (array: string[]): string[] => [...array, "double blink"]],
  [0b00100, (array: string[]): string[] => [...array, "close your eyes"]],
  [0b01000, (array: string[]): string[] => [...array, "jump"]],
  [0b10000, (array: string[]): string[] => array.reverse()],
]);

export function commands(code: number): string[] {
  return Array.from(events.entries()).reduce<string[]>(
    (sequence, [flag, action]) => {
      if (code & flag) {
        return action(sequence);
      }
      return sequence;
    },
    new Array()
  );
}
