module Binary
  def self.to_decimal(binary : String) : Int
    binary.reverse.chars.each_with_index.sum do |char, index|
      raise ArgumentError.new("Invalid binary string") unless char == '0' || char == '1'
      char.to_i << index
    end
  end
end
