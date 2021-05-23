module Isogram
  def self.isogram?(sentence)
    sanitized = sentence.gsub(/[\s-]+/, '').downcase
    sanitized.chars.uniq == sanitized.chars
  end
end
