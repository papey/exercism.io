class Scrabble
  TILES = {
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
  }

  def self.score(word)
    new(word).score
  end

  private

  attr_reader :tiles

  def initialize(word, tiles = TILES)
    @tiles = tiles.transform_keys { |key| key.downcase.to_sym }
    @tiles.default = 0
    @letters = word.to_s.downcase.chars.map(&:to_sym)
  end

  public

  attr_reader :letters

  def score
    @score ||= letters.sum { |letter| tiles[letter] }
  end
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
  }

  puts Scrabble.new("'Ae", HAWAIIAN_TILES).score
  puts Scrabble.new(nil, HAWAIIAN_TILES).score.inspect
  puts Scrabble.new('Humuhumunukunukuapua’a', HAWAIIAN_TILES).score.inspect

  SYMBOL_TILES = {
    'à' => 1,
    '-' => 2,
    '/' => 3
  }
  puts Scrabble.new('ààà', SYMBOL_TILES).score
  puts Scrabble.new(nil, SYMBOL_TILES).score.inspect
  puts Scrabble.new('à-/', SYMBOL_TILES).score.inspect

end
