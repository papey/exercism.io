module Squares
  def self.square_of_sum(num)
    (1..num).sum ** 2
  end

  def self.sum_of_squares(num)
    (1..num).sum { |x| x ** 2 }
  end

  def self.difference_of_squares(num)
    square_of_sum(num) - sum_of_squares(num)
  end
end
