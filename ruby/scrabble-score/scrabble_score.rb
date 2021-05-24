SCORING = {
  /[AEIOULNRST]/ => 1,
  /[DG]/ => 2,
  /[BCMP]/ => 3,
  /[FHVWY]/ => 4,
  /K/ => 5,
  /[JX]/ => 8,
  /[QZ]/ => 10
}.freeze

class Scrabble
  attr_reader :word

  def initialize(word)
    @word = word.to_s.strip.upcase
  end

  def self.score(word)
    (new word).score
  end

  def score
    @score ||= SCORING.each.sum { |(regex, value)| word.scan(regex).count * value }
  end
end
