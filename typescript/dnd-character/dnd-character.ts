export class DnDCharacter {
  readonly hitpoints: number;
  readonly strength: number;
  readonly dexterity: number;
  readonly constitution: number;
  readonly intelligence: number;
  readonly wisdom: number;
  readonly charisma: number;

  private readonly baseHitpoints = 10;

  constructor() {
    this.strength = DnDCharacter.generateAbilityScore();
    this.dexterity = DnDCharacter.generateAbilityScore();
    this.constitution = DnDCharacter.generateAbilityScore();
    this.intelligence = DnDCharacter.generateAbilityScore();
    this.wisdom = DnDCharacter.generateAbilityScore();
    this.charisma = DnDCharacter.generateAbilityScore();
    this.hitpoints =
      this.baseHitpoints + DnDCharacter.getModifierFor(this.constitution);
  }

  private static randInt(max: number = 5) {
    return Math.floor(Math.random() * max) + 1;
  }

  public static generateAbilityScore(): number {
    return new Array<number>(4)
      .fill(0)
      .map(() => this.randInt())
      .sort()
      .slice(-3)
      .reduce((a, b) => a + b, 0);
  }

  public static getModifierFor(abilityValue: number): number {
    return Math.floor((abilityValue - 10) / 2);
  }
}
