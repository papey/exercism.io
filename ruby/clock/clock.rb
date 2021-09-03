class Clock
  MINUTES_PER_HOUR = 60
  MINUTES_PER_DAY = MINUTES_PER_HOUR * 24

  attr_reader :minutes

  def initialize(hour: 0, minute: 0)
    self.minutes = minute + hour * MINUTES_PER_HOUR
  end

  def minutes=(minutes)
    @minutes = ((minutes % MINUTES_PER_DAY) + MINUTES_PER_DAY) % MINUTES_PER_DAY
  end

  def +(other)
    Clock.new(hour: 0, minute: minutes + other.minutes)
  end

  def -(other)
    Clock.new(hour: 0, minute: minutes - other.minutes)
  end

  def eql?(other)
    hash == other.hash
  end

  def hash
    minutes.hash
  end

  def ==(other)
    minutes == other.minutes
  end

  def to_s
    format('%02d:%02d', *minutes.divmod(MINUTES_PER_HOUR))
  end
end
