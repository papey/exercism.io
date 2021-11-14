class Anagram
  def initialize(word)
    @base = word.downcase
    @letters = @base.chars.sort
  end

  def match(candidates)
    candidates.reject { |candidate| candidate.downcase == @base || candidate.length != @base.length }
              .select { |candidate| @letters == candidate.downcase.chars.sort }
  end
end
