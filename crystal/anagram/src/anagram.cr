module Anagram
  def self.find(word : String, candidates : Array(String))
    word = word.downcase
    letters = word.chars.sort
    candidates.select { |candidate| candidate.downcase != word && letters == candidate.downcase.chars.sort }
  end
end
