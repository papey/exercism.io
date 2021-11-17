class Anagram
  private

  attr_reader :rejections, :selections

  def initialize(word)
    base = word.downcase
    letters = base.chars.sort
    @rejections = ->(candidate) { candidate.downcase == base }
    @selections = ->(candidate) { letters == candidate.downcase.chars.sort }
  end

  public

  def match(candidates)
    candidates.reject(&rejections)
              .select(&selections)
  end
end
