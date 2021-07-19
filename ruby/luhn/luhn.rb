module LuhnableString
  refine String do
    private

    def valid_length?(id_number)
      id_number.length > 1
    end

    def digits_only?(id_number)
      !id_number.match(/\D/)
    end

    def valid_sum?(id_number)
      (sum(id_number) % 10).zero?
    end

    def sum(id_number)
      digits = id_number.chars.map(&:to_i).reverse
      digits.map.with_index do |digit, index|
        index.odd? ? multiply(digit) : digit
      end.sum
    end

    def multiply(digit)
      value = digit * 2
      value > 9 ? value - 9 : value
    end

    public

    def valid_luhn?
      id_number = gsub(/\s+/, '')
      valid_length?(id_number) && digits_only?(id_number) && valid_sum?(id_number)
    end
  end
end

module Luhn
  using LuhnableString

  def self.valid?(id_number)
    id_number.valid_luhn?
  end
end
