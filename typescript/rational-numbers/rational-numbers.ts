function gcd(a: number, b: number): number {
  return b ? gcd(b, a % b) : a;
}

function nthRoot(base: number, n: number): number {
  return Math.pow(base, 1 / n);
}

export class Rational {
  num: number;
  den: number;

  constructor(numerator: number, denominator: number) {
    this.num = numerator;
    this.den = denominator;
    this.reduce();
  }

  add(other: Rational) {
    return new Rational(
      this.num * other.den + this.den * other.num,
      this.den * other.den
    );
  }

  sub(other: Rational) {
    return this.add(new Rational(-other.num, other.den));
  }

  mul(other: Rational) {
    return new Rational(this.num * other.num, this.den * other.den);
  }

  div(other: Rational) {
    return new Rational(this.num * other.den, this.den * other.num);
  }

  abs() {
    return new Rational(Math.abs(this.num), Math.abs(this.den));
  }

  exprational(exp: number) {
    return exp > 0
      ? new Rational(this.num ** exp, this.den ** exp)
      : new Rational(this.den ** -exp, this.num ** -exp);
  }

  expreal(base: number) {
    return nthRoot(base, this.den) ** this.num;
  }

  reduce() {
    const reducor = gcd(this.num, this.den);
    this.num /= reducor;
    this.den /= reducor;
    if (this.den < 0) {
      this.num *= -1;
      this.den *= -1;
    }
    return this;
  }
}
