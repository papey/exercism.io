export class ResistorColor {
  private static mapping: string[] = [
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white",
  ];

  private colors: string[];

  constructor(colors: string[]) {
    if (colors.length < 2) {
      throw "At least two colors need to be present";
    }
    this.colors = colors.slice(0, 2);
  }

  value = () =>
    Number.parseInt(
      this.colors.map((v) => ResistorColor.mapping.indexOf(v)).join("")
    );
}
