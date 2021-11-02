class Squares
  def initialize(value)
    @numbers = (1..value)
  end

  def square_of_sum
    @numbers.sum.abs2
  end

  def sum_of_squares
    @numbers.map(&:abs2).sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
