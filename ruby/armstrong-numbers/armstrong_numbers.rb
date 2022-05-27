# frozen_string_literal: true

module ArmstrongNumbers
  def self.include?(number)
    digits = number.digits
    n_digits = digits.length
    number == digits.sum { |digit| digit**n_digits }
  end
end
