class Hamming
  def self.distance(a, b)
    raise ArgumentError.new("Can only compare string with the same len") unless a.size == b.size

    a.chars.zip(b.chars).count { |a, b| a != b }
  end
end
