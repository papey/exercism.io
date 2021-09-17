module TwelveDays
  TEMPLATE = "On the %s day of Christmas my true love gave to me: %s\n".freeze

  VERSES_MAP = {
    1 => { day: 'first', item: 'a Partridge in a Pear Tree.' },
    2 => { day: 'second', item: 'two Turtle Doves, and ' },
    3 => { day: 'third', item: 'three French Hens, ' },
    4 => { day: 'fourth', item: 'four Calling Birds, ' },
    5 => { day: 'fifth', item: 'five Gold Rings, ' },
    6 => { day: 'sixth', item: 'six Geese-a-Laying, ' },
    7 => { day: 'seventh', item: 'seven Swans-a-Swimming, ' },
    8 => { day: 'eighth', item: 'eight Maids-a-Milking, ' },
    9 => { day: 'ninth', item: 'nine Ladies Dancing, ' },
    10 => { day: 'tenth', item: 'ten Lords-a-Leaping, ' },
    11 => { day: 'eleventh', item: 'eleven Pipers Piping, ' },
    12 => { day: 'twelfth', item: 'twelve Drummers Drumming, ' }
  }

  private_constant :VERSES_MAP, :TEMPLATE

  def self.verse(index)
    format(TEMPLATE, day(index), items(index))
  end

  def self.day(index)
    VERSES_MAP[index][:day]
  end

  def self.items(index)
    (1..index).reverse_each.sum('') { |i| VERSES_MAP[i][:item] }
  end

  def self.song
    (1..12).map { |i| verse(i) }.join("\n")
  end
end
