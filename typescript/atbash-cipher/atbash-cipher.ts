const ENCODE_SIZE = 5;

const A = "a".charCodeAt(0);
const Z = "z".charCodeAt(0);
const SHIFT = A + Z;

export function encode(plainText: string): string {
  return chunk(convert(plainText), ENCODE_SIZE).join(" ");
}

export function decode(cipherText: string): string {
  return convert(cipherText).join("");
}

function convert(text: string): string[] {
  return normalize(text)
    .split("")
    .map((letter) => {
      const code = letter.charCodeAt(0);
      if (code < A || code > Z) {
        return letter;
      }
      return String.fromCharCode(SHIFT - code);
    });
}

function normalize(text: string): string {
  return text.toLocaleLowerCase().replace(/[^a-z0-9]/g, "");
}

function chunk<T>(array: T[], size: number): string[] {
  let tmp: string[] = new Array();

  for (let i = 0, j = array.length; i < j; i += size)
    tmp.push(array.slice(i, i + size).join(""));

  return tmp;
}
