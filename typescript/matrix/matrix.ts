class Matrix {
  rows: number[][];
  columns: number[][];

  constructor(input: string) {
    this.rows = input
      .split("\n")
      .map((line) => line.split(" ").map((value) => Number.parseInt(value)));

    this.columns = this.rows[0].map((_, c) =>
      this.rows.map((_, r) => this.rows[r][c])
    );
  }
}

export default Matrix;
