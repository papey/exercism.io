module Year
  def self.leap?(y : Int)
    y.divisible_by?(4) && (!y.divisible_by?(100) || y.divisible_by?(400))
  end
end
