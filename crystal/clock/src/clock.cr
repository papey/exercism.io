MINUTES_PER_HOUR = 60
HOURS_PER_DAY    = 24

class Clock
  @hour : Int32
  @minute : Int32

  getter :hour, :minute

  def initialize(@hour = 0, @minute = 0)
    normalize
  end

  def -(other : Clock)
    @hour -= other.hour
    @minute -= other.minute
    normalize
  end

  def +(other : Clock)
    @hour += other.hour
    @minute += other.minute
    normalize
  end

  def ==(other : Clock)
    @hour == other.hour && @minute == other.minute
  end

  def to_s
    sprintf("%02d:%02d", hour, minute)
  end

  private def normalize
    @hour += minute // MINUTES_PER_HOUR
    @hour %= HOURS_PER_DAY
    @minute %= MINUTES_PER_HOUR
    self
  end
end
