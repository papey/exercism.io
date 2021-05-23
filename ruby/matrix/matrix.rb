# Matrix base class
class Matrix

  def initialize(input)
    @input = input
  end

  def rows
    @rows ||= @input.lines.map { |row| row.split.map(&:to_i) }
  end

  def columns
    rows.transpose
  end
end
