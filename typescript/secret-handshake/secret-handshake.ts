export default class HandShake {
  code: number;

  private static readonly EVENTS: Map<number, string> = new Map([
    [0b00001, "wink"],
    [0b00010, "double blink"],
    [0b00100, "close your eyes"],
    [0b01000, "jump"],
  ]);

  private static readonly REVERSE = 0b10000;

  constructor(code: number) {
    this.code = code;
  }

  commands(): string[] {
    const sequence: string[] = [];

    HandShake.EVENTS.forEach((action, flag) => {
      if (this.code & flag) sequence.push(action);
    });

    return this.code & HandShake.REVERSE ? sequence.reverse() : sequence;
  }
}
