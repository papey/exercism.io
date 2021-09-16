NON_ALPHANUM_REGEX = /[^A-Za-z0-9]/

struct Char
  def atbash_encode
    return self unless 'a' <= self <= 'z'

    ('a'.ord + ('z' - self)).chr
  end

  def atbash_decode
    return self unless 'a' <= self <= 'z'

    ('z'.ord - (self - 'a')).chr
  end
end

class String
  def atbash_encode
    self
      .gsub(NON_ALPHANUM_REGEX, "")
      .downcase
      .chars
      .map(&.atbash_encode)
      .in_groups_of(5).flat_map do |element|
      element.compact.join
    end.join(" ")
  end

  def atbash_decode
    self
      .gsub(/\s/, "")
      .downcase
      .chars
      .map(&.atbash_decode)
      .join("")
  end
end

module AtbashCipher
  def self.encode(sentence)
    sentence.atbash_encode
  end

  def self.decode(sentence)
    sentence.atbash_decode
  end
end
