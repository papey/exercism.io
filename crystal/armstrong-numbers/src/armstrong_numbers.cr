require "math"

# Please implement your solution to armstrong-numbers in this file
module ArmstrongNumbers
  def self.armstrong_number?(value : Int) : Bool
    digits = value.to_s.chars.map(&.to_i)
    len = digits.size
    value == digits.sum { |value| value**len }
  end
end
