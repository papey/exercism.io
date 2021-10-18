class SpaceAge
  EARTH_SECOND_PER_YEAR = 31_557_600.to_f
  PLANETS_TO_EARTH_ORBITAL_PERIODS = {
    mercury: 0.2408467,
    venus: 0.61519726,
    earth: 1,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }.freeze

  private_constant :PLANETS_TO_EARTH_ORBITAL_PERIODS, :EARTH_SECOND_PER_YEAR

  PLANETS_TO_EARTH_ORBITAL_PERIODS.each do |planet, period|
    define_method("on_#{planet}".to_sym) { convert(period) }
  end

  private

  def initialize(seconds)
    @seconds = seconds
  end

  def convert(period)
    (@seconds / EARTH_SECOND_PER_YEAR) / period
  end
end
