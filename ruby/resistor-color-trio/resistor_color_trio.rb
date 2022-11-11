# frozen_string_literal: true

COLORS_CODES = %w[
  black
  brown
  red
  orange
  yellow
  green
  blue
  violet
  grey
  white
].freeze

class ResistorColorTrio
  attr_reader :first, :second, :zeros

  def initialize(colors)
    raise ArgumentError unless colors.all? { |c| COLORS_CODES.include?(c) }

    @first, @second, @zeros = colors.map { |c| COLORS_CODES.index(c) }
  end

  def label
    resistor, unit = normalize
    "Resistor value: #{resistor} #{unit}"
  end

  private

  def value
    @_value = "#{first}#{second}#{"0" * zeros}".to_i
  end

  def normalize
    is_k = value > 1000
    [is_k ? value / 1000 : value, is_k ? "kiloohms" : "ohms"]
  end
end
