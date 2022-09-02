module Isogram
  def self.isogram?(sentence)
    sanitized = sentence.scan(/[\w]/).map(&:downcase)
    sanitized.uniq.length == sanitized.length
  end
end
