class Anagram
  private

  attr_reader :is_anagram, :is_same_word

  def initialize(word)
    base = word.downcase
    letters = base.chars.sort
    @is_same_word = ->(candidate) { candidate.downcase == base }
    @is_anagram = ->(candidate) { letters == candidate.downcase.chars.sort }
  end

  public

  def match(candidates)
    candidates.reject(&is_same_word)
              .select(&is_anagram)
  end
end
