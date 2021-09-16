module TwelveDays
  DAYS = %w[
    first
    second
    third
    fourth
    fifth
    sixth
    seventh
    eighth
    ninth
    tenth
    eleventh
    twelfth
  ]

  GIFTS = [
    'twelve Drummers Drumming, ',
    'eleven Pipers Piping, ',
    'ten Lords-a-Leaping, ',
    'nine Ladies Dancing, ',
    'eight Maids-a-Milking, ',
    'seven Swans-a-Swimming, ',
    'six Geese-a-Laying, ',
    'five Gold Rings, ',
    'four Calling Birds, ',
    'three French Hens, ',
    'two Turtle Doves, and ',
    'a Partridge in a Pear Tree.'
  ]

  private_constant :DAYS, :GIFTS

  def self.song
    "#{(1..DAYS.length).map { |index| verse(index) }.join("\n\n")}\n"
  end

  def self.verse(verse_index)
    "On the #{DAYS[verse_index - 1]} day of Christmas my true love gave to me: #{GIFTS.last(verse_index).join}"
  end
end
