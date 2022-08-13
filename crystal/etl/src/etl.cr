module ETL
  def self.transform(input)
    input.each_with_object({} of String => Int32) do |(score, letters), result|
      letters.each { |letter| result[letter.downcase] = score.to_i }
    end
  end
end
