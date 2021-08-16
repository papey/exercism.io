export default class Clock {
  minsPerHour = 60;
  minsPerDay = 24 * this.minsPerHour;
  private total: number;

  constructor(hours: number, mins: number = 0) {
    this.total = this.normalize(hours, mins);
  }

  plus = (mins: number): Clock => {
    this.total = this.normalize(0, this.total + mins);
    return this;
  };

  minus = (mins: number): Clock => {
    this.total = this.normalize(0, this.total - mins);
    return this;
  };

  equals = (c: Clock): boolean => this.total === c.total;

  private normalize = (hours: number, mins: number): number =>
    (((mins + hours * this.minsPerHour) % this.minsPerDay) + this.minsPerDay) %
    this.minsPerDay;

  private getMinutes = (): number => this.total % this.minsPerHour;

  private getHours = (): number => Math.floor(this.total / 60);

  private format = (n: number): string => n.toString().padStart(2, "0");

  toString = (): string =>
    `${this.format(this.getHours())}:${this.format(this.getMinutes())}`;
}
