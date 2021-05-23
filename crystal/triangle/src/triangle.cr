alias Side = Int32 | Float64
alias Sides = Tuple(Side, Side, Side)

enum Triangle
  Equilateral = 1
  Isosceles
  Scalene

  def self.new(sides : Sides)
    raise ArgumentError.new unless sides.max < sides.sum / 2
    from_value sides.to_set.size
  end

  def isosceles?
    previous_def || equilateral?
  end
end
