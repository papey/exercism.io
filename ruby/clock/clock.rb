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

  def hour
    minutes / MINUTES_PER_HOUR
  end

  def minute
    minutes % MINUTES_PER_HOUR
  end

  def +(other)
    Clock.new(hour: 0, minute: minutes + other.minutes)
  end

  def -(other)
    Clock.new(hour: 0, minute: minutes - other.minutes)
  end

  def ==(other)
    minutes == other.minutes
  end

  def to_s
    "#{'%02d' % hour}:#{'%02d' % minute}"
  end
end
