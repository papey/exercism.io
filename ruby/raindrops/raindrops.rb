module FactorableInteger
  refine Integer do
    def factor_of?(integer)
      (integer % self).zero?
    end
  end
end

class Raindrops
  using FactorableInteger
  RULES = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }.freeze

  def self.convert(raindrop)
    new(raindrop).to_s
  end

  def to_s
    sound.to_s
  end

  private

  attr_reader :rules, :raindrop

  def initialize(raindrop, rules = RULES)
    @raindrop = raindrop
    @rules = rules
  end

  def sound
    melody.empty? ? raindrop : melody
  end

  def melody
    @melody ||= rules.reduce('') do |melody, (factor, sound)|
      melody << sound if factor.factor_of?(raindrop)
      melody
    end
  end
end

if $PROGRAM_NAME == __FILE__
  FIZZ_BUZZ = {
    5 => 'Fizz',
    7 => 'Buzz'
  }

  -15.upto(15) do |integer|
    puts Raindrops.new(integer, FIZZ_BUZZ)
  end
end
