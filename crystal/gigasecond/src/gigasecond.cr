DELAY = 1_000_000_000.seconds

module Gigasecond
  def self.from(date)
    date + DELAY
  end
end
