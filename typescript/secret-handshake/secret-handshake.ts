export default class HandShake {
  code: number;

  private static readonly INSTRUCTIONS = [
    "wink",
    "double blink",
    "close your eyes",
    "jump",
  ];

  constructor(code: number) {
    this.code = code;
  }

  commands(): string[] {
    const sequence = HandShake.INSTRUCTIONS.filter(
      (_, i) => (this.code >> i) & 0x1
    );

    return this.code & 0x10 ? sequence.reverse() : sequence;
  }
}
