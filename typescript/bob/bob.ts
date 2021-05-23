class Bob {
  hey(input: string): string {
    const sanitized = input.trim();
    const isAlpha = this.isAlpha(sanitized);
    const isSilence = this.isSilence(sanitized);
    const isQuestion = this.isQuestion(sanitized);
    const isShouting = this.isShouting(sanitized);

    if (isQuestion && isShouting && isAlpha) {
      return "Calm down, I know what I'm doing!";
    }

    if (isQuestion) {
      return "Sure.";
    }

    if (isSilence) {
      return "Fine. Be that way!";
    }

    if (isShouting && isAlpha) {
      return "Whoa, chill out!";
    }

    return "Whatever.";
  }

  private isAlpha(input: string): boolean {
    return /[a-zA-Z]/.test(input);
  }

  private isSilence(input: string): boolean {
    return input == "";
  }

  private isShouting(input: string): boolean {
    return input.toUpperCase() == input;
  }

  private isQuestion(input: string): boolean {
    return input.endsWith("?");
  }
}

export default Bob;
