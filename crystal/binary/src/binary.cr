class Binary
  def self.to_decimal(binary : String) : Int
    raise ArgumentError.new("Invalid binary string") unless binary.match(/^[0-1]+$/)

    binary.reverse.chars.each_with_index.sum do |char, index|
      char.to_i << index
    end
  end
end
