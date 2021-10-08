module ModularInteger
  refine Integer do
    def divisible_by?(n)
      self % n == 0
    end
  end
end

module Year
  using ModularInteger

  def self.leap?(year)
    year.divisible_by?(4) && !year.divisible_by?(100) || year.divisible_by?(400)
  end
end
