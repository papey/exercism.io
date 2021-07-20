pub fn is_leap_year(year: u64) -> bool {
    if divisible_by(year, 4) && (!divisible_by(year, 100) || divisible_by(year, 400)) {
        return true;
    }
    false
}

fn divisible_by(dividend: u64, divisor: u64) -> bool {
    dividend % divisor == 0
}
