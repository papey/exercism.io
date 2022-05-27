# frozen_string_literal: true

module ArmstrongNumbers
  def self.include?(number)
    digits = number.digits
    number == digits.sum { |digit| digit**digits.length }
  end
end
