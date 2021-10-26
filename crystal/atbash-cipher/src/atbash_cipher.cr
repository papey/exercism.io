NON_ALPHANUM_REGEX = /[^A-Za-z0-9]/

ALPHABET = "abcdefghijklmnopqrstuvwxyz"
ATBASH   = "zyxwvutsrqponmlkjihgfedcba"

module AtbashCipher
  def self.encode(sentence)
    sentence
      .gsub(NON_ALPHANUM_REGEX, "")
      .downcase
      .tr(ALPHABET, ATBASH)
      .chars
      .in_groups_of(5).flat_map { |e| e.compact.join }
      .join(" ")
  end

  def self.decode(sentence)
    sentence
      .gsub(/\s/, "")
      .downcase
      .tr(ATBASH, ALPHABET)
  end
end
