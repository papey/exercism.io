module Pangram
  ALPHA = ('a'..'z').freeze

  def self.pangram?(sentence)
    normalized = sentence.downcase
    ALPHA.all? { |letter| normalized.include?(letter) }
  end
end
