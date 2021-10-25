NON_ALPHANUM_REGEX = /[^A-Za-z0-9]/

A = 'a'.ord
Z = 'z'.ord

SHIFT = A + Z

module AtbashCipher
  def self.encode(sentence)
    sentence
      .gsub(NON_ALPHANUM_REGEX, "")
      .downcase
      .chars
      .map { |l| convert(l) }
      .in_groups_of(5).flat_map do |element|
      element.compact.join
    end.join(" ")
  end

  def self.convert(letter)
    code = letter.ord
    return letter if code < A || code > Z
    (SHIFT - code).chr
  end

  def self.decode(sentence)
    sentence
      .gsub(/\s/, "")
      .downcase
      .chars
      .map { |l| convert(l) }
      .join("")
  end
end
