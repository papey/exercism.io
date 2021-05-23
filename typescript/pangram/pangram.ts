const a: number = "a".charCodeAt(0);
const alpha = [...Array(26)].map((_, i) => String.fromCharCode(a + i));

export default class Pangram {
  data: string;
  isPangram: () => boolean;

  constructor(input: string) {
    this.data = input.toLocaleLowerCase();
    this.isPangram = () => alpha.every((letter) => this.data.includes(letter));
  }
}
