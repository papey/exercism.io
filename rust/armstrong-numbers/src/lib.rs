pub fn is_armstrong_number(num: u32) -> bool {
    // collect digits into a vec
    let digits: Vec<u32> = num
        .to_string()
        .chars()
        .map(|c| c.to_digit(10).unwrap())
        .collect();

    // get power using vec len
    let power = digits.len();

    // check for equality
    num == digits
        .into_iter()
        .fold(0, |acc, digit| acc + digit.pow(power as u32))
}
