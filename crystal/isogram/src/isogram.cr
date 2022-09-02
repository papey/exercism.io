module Isogram
  def self.isogram?(sentence : String)
    return true if sentence.empty?

    sentence.scan(/[\w]/).map { |c| c[0].downcase }.uniq.size === sentence.gsub(/[^a-zA-Z]/, "").size
  end
end
