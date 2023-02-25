module main

// is_leap_year returns true if the given year is a leap year in the Gregorian calendar
fn is_leap_year(year int) bool {
  if year % 100 == 0 {
    return year % 400 == 0
  }

  return year % 4 == 0
}