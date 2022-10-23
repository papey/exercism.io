# frozen_string_literal: true

module Grains
  SIZE = 64

  def self.square(n)
    raise ArgumentError if n <= 0 || n > 64

    1 << (n - 1)
  end

  def self.total
    (1 << SIZE) - 1
  end
end
