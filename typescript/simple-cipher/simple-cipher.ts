const ALPHABET_LEN = 26;
const ALPHABET_START = "a".charCodeAt(0);
const ALPHABET_END = "z".charCodeAt(0);

const MIN_KEY_SIZE = 100;

enum DIRECTION {
  Right = 1,
  Left,
}

function genKey(size: number = MIN_KEY_SIZE): string {
  return [...Array(size).keys()]
    .map(() =>
      String.fromCodePoint(
        ALPHABET_START + Math.floor(Math.random() * ALPHABET_LEN)
      )
    )
    .join("");
}

export class SimpleCipher {
  key: string;

  constructor(key?: string) {
    if (key === undefined) {
      this.key = genKey();
    } else {
      this.key = key;
    }
  }

  encode(plainText: string): string {
    return this.shift(plainText, DIRECTION.Right);
  }

  decode(cipherText: string): string {
    return this.shift(cipherText, DIRECTION.Left);
  }

  private shift(text: string, dir: DIRECTION): string {
    return [...text]
      .map((char, i) => {
        const shiftDistance = this.keycode(i) - ALPHABET_START;
        const shiftedChar =
          dir === DIRECTION.Right
            ? char.charCodeAt(0) + shiftDistance
            : char.charCodeAt(0) - shiftDistance;
        const normalizeBase =
          dir === DIRECTION.Right ? ALPHABET_START : ALPHABET_END;

        return String.fromCharCode(
          this.normalizeCharCode(shiftedChar, normalizeBase)
        );
      })
      .join("");
  }

  private keycode(index: number): number {
    return this.key[index % this.key.length].charCodeAt(0);
  }

  private normalizeCharCode = (charCode: number, base: number): number =>
    ((charCode - base) % ALPHABET_LEN) + base;
}
