use std::fmt;

#[derive(Debug, PartialEq)]
pub struct Clock {
    mins: i32,
}

const MINS_PER_HOUR: i32 = 60;
const MINS_PER_DAY: i32 = MINS_PER_HOUR * 24;

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        Clock {
            mins: (((minutes + hours * MINS_PER_HOUR) % MINS_PER_DAY) + MINS_PER_DAY)
                % MINS_PER_DAY,
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Clock::new(0, self.mins + minutes)
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:0>2}:{:0>2}", self.mins / 60, self.mins % 60)
    }
}
