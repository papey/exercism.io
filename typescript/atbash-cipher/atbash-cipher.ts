// Add simple chunk method to array interface
declare global {
  interface Array<T> {
    chunk(size: number): T[];
  }
}

// Implement the chunk function for any kind of array
Array.prototype.chunk = function chunk<T>(this: T[], size: number): T[] {
  let tmp = new Array();

  for (let i = 0, j = this.length; i < j; i += size)
    tmp.push(this.slice(i, i + size).join(""));

  return tmp;
};

const ALPHA: string[] = Array.from("abcdefghijklmnopqrstuvwxyz");
const REVERSE_ALPHA: string[] = Array.from(ALPHA).reverse();

const ENCODE_SIZE: number = 5;

export function encode(plainText: string): string {
  return convert(plainText, ALPHA, REVERSE_ALPHA).chunk(ENCODE_SIZE).join(" ");
}

export function decode(cipherText: string): string {
  return convert(cipherText, REVERSE_ALPHA, ALPHA).join("");
}

function convert(text: string, from: string[], to: string[]): string[] {
  return normalize(text)
    .split("")
    .map((letter) => {
      const index = from.indexOf(letter);
      if (index === -1) {
        return letter;
      }
      return to[index];
    });
}

function normalize(text: string): string {
  return text.toLocaleLowerCase().replace(/[^a-z0-9]/g, "");
}
