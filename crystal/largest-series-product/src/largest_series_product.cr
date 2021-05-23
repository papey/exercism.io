class Series
  def initialize(@input : String)
    return 1 if @input.empty?
    raise ArgumentError.new unless /\d/.match(@input).not_nil!
  end

  def largest_product(combinator : Int)
    raise ArgumentError.new unless @input.size >= combinator
    return 1 unless !combinator.zero?
    @input.each_char.cons(combinator).max_of(&.product(&.to_i64))
  end
end
