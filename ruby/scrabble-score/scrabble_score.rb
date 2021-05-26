DEFAULT_TILES = {
  'A' => 1, 'N' => 1,
  'B' => 3, 'O' => 1,
  'C' => 3, 'P' => 3,
  'D' => 2, 'Q' => 10,
  'E' => 1, 'R' => 1,
  'F' => 4, 'S' => 1,
  'G' => 2, 'T' => 1,
  'H' => 4, 'U' => 1,
  'I' => 1, 'V' => 4,
  'J' => 8, 'W' => 4,
  'K' => 5, 'X' => 8,
  'L' => 1, 'Y' => 4,
  'M' => 3, 'Z' => 10
}.freeze

class Tiles
  attr_reader :tiles

  def initialize(tiles)
    @tiles = tiles
  end

  def scoring
    tiles.each_with_object(Hash.new('')) { |(letter, value), scoring| scoring[value] += letter.to_s }
  end
end

class Scrabble
  attr_reader :word

  def initialize(word, tiles = DEFAULT_TILES)
    @tiles = Tiles.new(tiles)
    @word = word.to_s.upcase
  end

  def self.score(word)
    new(word).score
  end

  def score
    @score ||= tiles.scoring.sum { |(score, letters)| word.scan(Regexp.new("[#{letters}]")).count * score }
  end

  private

  attr_reader :tiles
end

if $PROGRAM_NAME == __FILE__
  HAWAIIAN_TILES = {
    A: 1, N: 3,
    O: 2,
    P: 8,
    E: 4,
    H: 6, U: 5,
    I: 3,
    W: 9,
    K: 2,
    L: 7,
    M: 8
  }.freeze

  puts Scrabble.new("'Ae", HAWAIIAN_TILES).score
  puts Scrabble.new(nil, HAWAIIAN_TILES).score.inspect
end
