class BirdCount
  BUSY_DAYS = 5

  attr_reader :history

  def self.last_week
    [0, 2, 5, 3, 7, 8, 4]
  end

  def initialize(birds_per_day)
    @history = birds_per_day
  end

  def yesterday
    history[-2]
  end

  def total
    history.sum
  end

  def busy_days
    history.select { |birds| birds >= BUSY_DAYS }.count
  end

  def day_without_birds?
    history.any?(&:zero?)
  end
end
