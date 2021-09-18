class TwelveDays
  TEMPLATE = "On the %<day>s day of Christmas my true love gave to me: %<items>s\n".freeze

  # VDI stands for Verses to day and item
  VDI = {
    1 => { day: 'first', item: 'a Partridge in a Pear Tree.' },
    2 => { day: 'second', item: 'two Turtle Doves, ', extra: 'and ' },
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
  }.freeze

  private_constant :VDI, :TEMPLATE

  def self.song
    new.to_s
  end

  private

  def verse(index)
    TEMPLATE % { day: VDI[index][:day], items: items(index) } # rubocop:disable Style/FormatString
  end

  def day(index)
    VDI[index][:day]
  end

  def items(index)
    (1..index).reverse_each.sum('') { |i| "#{VDI[i][:item]}#{VDI[i][:extra] || ''}" }
  end

  public

  def to_s
    VDI.keys.map { |i| verse(i) }.join("\n")
  end
end
