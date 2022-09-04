module MatchingBrackets
  MATCHING = {'{' => '}', '[' => ']', '(' => ')'}
  CLOSING  = MATCHING.values

  def self.valid?(sentence)
    return true if sentence.empty?

    stack = [] of Char

    sentence.chars.each do |ch|
      stack << ch if MATCHING.keys.includes?(ch)

      return false if CLOSING.includes?(ch) && (stack.empty? || ch != MATCHING[stack.pop])
    end

    stack.empty?
  end
end
