class SumOfMultiples
  private

  attr_reader :factors

  def initialize(*factors)
    @factors = factors
  end

  def multiples?(number)
    @factors.any? { |f| number.modulo(f).zero? }
  end

  public

  def to(number)
    (1..number - 1).filter { |candidate| multiples?(candidate) }.sum
  end
end
