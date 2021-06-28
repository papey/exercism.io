MINS_PER_HOUR = 60
MINS_PER_DAY = 24 * MINS_PER_HOUR


class Clock:
    def __init__(self, hour, minute):
        self.minutes = (hour * MINS_PER_HOUR + minute) % MINS_PER_DAY

    def __repr__(self):
        return f"{self.minutes // MINS_PER_HOUR:02}:{self.minutes % MINS_PER_HOUR:02}"

    def __eq__(self, other):
        return self.minutes == other.minutes

    def __add__(self, minutes):
        return Clock(0, self.minutes + minutes)

    def __sub__(self, minutes):
        return Clock(0, self.minutes - minutes)
