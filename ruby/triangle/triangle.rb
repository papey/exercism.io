class Triangle
  def initialize(sides)
    raise StandardError('Triangle without exactly three size ? Duh.') if sides.length != 3

    @sides = sides
  end

  def valid?
    return false if @sides.any? { |s| s.zero? }

    @sides.permutation(3).all? { |(a, b, c)| a <= b + c }
  end

  def equilateral?
    valid? &&@sides.uniq.length == 1
  end

  def isosceles?
    valid? && @sides.uniq.length <= 2
  end

  def scalene?
    valid? && @sides.uniq.length == 3
  end
end
