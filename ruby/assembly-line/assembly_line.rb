class AssemblyLine
  attr_reader :speed, :success_rate

  MINUTES_PER_HOUR = 60
  CARS_PER_HOUR = 221
  SUCCESS_RATES = {
    1..4 => 1,
    5..8 => 0.9,
    9 => 0.8, 10 => 0.77
  }.freeze

  def initialize(speed)
    @speed = speed
    @success_rate = SUCCESS_RATES.select { |rate| rate === speed }.values.first
  end

  def production_rate_per_hour
    speed * CARS_PER_HOUR * success_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / MINUTES_PER_HOUR).to_i
  end
end
