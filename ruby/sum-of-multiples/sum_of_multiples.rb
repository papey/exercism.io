class SumOfMultiples
  private

  attr_reader :multiples

  def initialize(*multiples)
    @multiples = multiples
  end

  def multiples?(number)
    multiples.any? { |multiple| number.modulo(multiple).zero? }
  end

  public

  def to(number)
    (1...number).sum { |candidate| multiples?(candidate) ? candidate : 0 }
  end
end
