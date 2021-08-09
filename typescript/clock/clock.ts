export default class Clock {
  minsPerHour = 60;
  minsPerDay = 24 * this.minsPerHour;
  private total: number;

  constructor(hours: number, mins: number = 0) {
    this.total =
      (((mins + hours * this.minsPerHour) % this.minsPerDay) +
        this.minsPerDay) %
      this.minsPerDay;
  }

  plus = (mins: number): Clock => new Clock(0, this.total + mins);

  minus = (mins: number): Clock => new Clock(0, this.total - mins);

  equals = (c: Clock): boolean => this.total === c.total;

  getMinutes = (): number => this.total % this.minsPerHour;

  getHours = (): number => Math.floor(this.total / 60);

  private format = (n: number): string => n.toString().padStart(2, "0");

  toString = (): string =>
    `${this.format(this.getHours())}:${this.format(this.getMinutes())}`;
}
