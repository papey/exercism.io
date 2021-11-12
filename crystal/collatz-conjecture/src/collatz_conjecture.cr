module CollatzConjecture
  def self.steps(value : Int32) : Int32
    raise ArgumentError.new("Value can't be negative") unless value > 0

    steps = 0
    until value == 1
      value.even? ? (value //= 2) : (value = 3 * value + 1)
      steps += 1
    end

    steps
  end
end
