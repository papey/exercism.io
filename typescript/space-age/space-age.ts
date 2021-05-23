const earthSeconds = 31557600;

const ratios: Record<string, number> = {
  Earth: 1,
  Mercury: 0.2408467,
  Venus: 0.61519726,
  Mars: 1.8808158,
  Jupiter: 11.862615,
  Saturn: 29.447498,
  Uranus: 84.016846,
  Neptune: 164.79132,
};

export default class SpaceAge {
  seconds: number;
  [planet: string]: number | (() => number);

  constructor(seconds: number) {
    this.seconds = seconds;

    for (const key in ratios) {
      this[`on${key}`] = () =>
        Number((seconds / ratios[key] / earthSeconds).toFixed(2));
    }
  }
}
