//
// This is only a SKELETON file for the 'Matrix' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export class Matrix {
  constructor(input) {
    this.data = input.split("\n").map((line) => line.split(" ").map((value) => Number(value)))
    // this._columns = this.data[0].map((_, c) => this.data.map((_, r) => this.data[r][c]))
    this._columns = undefined
  }

  get rows() {
    return this.data
  }

  get columns() {
    // return this._columns
    return this._columns = this._columns || this.data[0].map((_, c) => this.data.map((_, r) => this.data[r][c]))
  }
}
