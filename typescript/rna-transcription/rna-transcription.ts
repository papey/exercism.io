type Nucleotide = "G" | "C" | "A" | "T";

class Transcriptor {
  translate: Record<Nucleotide, string> = {
    G: "C",
    C: "G",
    A: "U",
    T: "A",
  };

  toRna(dna: string): string {
    return dna
      .split("")
      .map((elem) => this.translate[elem as Nucleotide] || this.error())
      .join("");
  }

  error(): never {
    throw new Error("Invalid input DNA.");
  }
}

export default Transcriptor;
