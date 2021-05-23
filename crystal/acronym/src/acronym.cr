module Acronym
  def self.abbreviate(sentence : String) : String
    sentence.delete("_'").scan(/\b\w/).map(&.[0]).join.upcase
  end
end
