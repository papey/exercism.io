class Phrase
  attr_reader :sentence

  def initialize(sentence)
    @sentence = sentence
  end

  def word_count
    @word_count ||= sentence
                    .downcase
                    .scan(/\b[\w']+\b/).each_with_object(Hash.new(0)) { |w, acc| acc[w] += 1 }
  end
end
