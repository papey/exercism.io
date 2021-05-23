const LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("");
const NUMBERS = [...Array(1000)].map((_, i) => i.toString().padStart(3, "0"));
const ALLNAMES = genAllNames();

function genAllNames(): string[] {
  return LETTERS.flatMap((l1) =>
    LETTERS.flatMap((l2) => NUMBERS.flatMap((num) => `${l1}${l2}${num}`))
  );
}

export default class Robot {
  private _name: string;
  // use spread operator to mimic a deep copy
  private static freeNames: string[] = [...ALLNAMES];

  constructor() {
    this._name = this.newName();
  }

  public get name(): string {
    return this._name;
  }

  public resetName(): void {
    this._name = this.newName();
  }

  public static releaseNames(): void {
    // use spread operator to mimic a deep copy
    Robot.freeNames = [...ALLNAMES];
  }

  private newName(): string {
    const end = Robot.freeNames.length - 1;
    const idx = Math.round(Math.random() * end);
    const name = Robot.freeNames[idx];
    this.removeFromFreeNames(idx);

    return name;
  }

  private removeFromFreeNames(index: number) {
    const end = Robot.freeNames.length - 1;
    [Robot.freeNames[index], Robot.freeNames[end]] = [
      Robot.freeNames[end],
      Robot.freeNames[index],
    ];
    Robot.freeNames.pop();
  }
}
