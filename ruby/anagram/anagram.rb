class Anagram
  def initialize(word)
    @base = word.downcase
    @letters = @base.chars.sort
  end

  def match(candidates)
    candidates.select do |candidate|
      next if candidate.length != @base.length

      downcased_candidate = candidate.downcase

      next if downcased_candidate == @base

      @letters == downcased_candidate.chars.sort
    end
  end
end
