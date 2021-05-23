class Series
  attr_reader :series

  def initialize(series)
    @series = series.split('')
  end

  def slices(len)
    raise ArgumentError, 'Slices length cannot be longer than series length' unless len <= series.length

    series.each_cons(len).map(&:join)
  end
end
