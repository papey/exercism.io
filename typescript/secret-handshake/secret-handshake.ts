// Define an action to do when a code is received
type Action = (array: string[]) => string[];

// Define custom events
type Events = Map<number, Action>;

class Enumerable<T> {
  private iterable: Iterable<T>;

  constructor(iterable: Iterable<T>) {
    this.iterable = iterable;
  }

  reduce(
    callback: (acc: string[], action: T) => string[],
    init: string[]
  ): string[] {
    let res = init;

    for (let elem of this.iterable) res = callback(res, elem);

    return res;
  }
}

const events: Events = new Map([
  [0b00001, (array: string[]): string[] => [...array, "wink"]],
  [0b00010, (array: string[]): string[] => [...array, "double blink"]],
  [0b00100, (array: string[]): string[] => [...array, "close your eyes"]],
  [0b01000, (array: string[]): string[] => [...array, "jump"]],
  [0b10000, (array: string[]): string[] => array.reverse()],
]);

export function commands(code: number): string[] {
  return new Enumerable(events).reduce(
    (sequence: string[], [flag, action]: [number, Action]) => {
      if (code & flag) {
        return action(sequence);
      }
      return sequence;
    },
    []
  );
}
