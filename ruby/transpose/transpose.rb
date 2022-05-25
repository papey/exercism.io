class Transpose
  def self.transpose(input)
    lines = input.split("\n")
    size = lines.map(&:size).max

    lines
      .map { |line| line.ljust(size, "\0").chars }
      .transpose
      .map(&:join)
      .join("\n")
      .gsub(/\0+$/, '')
      .gsub(/\0/, ' ')
  end
end
