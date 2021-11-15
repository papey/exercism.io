class Anagram
  attr_reader :base, :letters

  def initialize(word)
    @base = word.downcase
    @letters = @base.chars.sort
  end

  def match(candidates)
    candidates.reject { |candidate| candidate.downcase == base }
              .select { |candidate| letters == candidate.downcase.chars.sort }
  end
end
