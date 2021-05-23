/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    // check for len before everything else
    if code.len() <= 1 {
        return false;
    }

    let mut chars: u32 = 0;
    let mut sum: u32 = 0;

    // check in place and avoid multiple loops over the entire string
    // return early if invalid char found
    // rev is used to get shift correctly when computing second digits
    for ch in code.chars().rev() {
        match ch {
            '0'..='9' => {
                // count and enumerate chars found
                chars += 1;
                // unwrap is ok here since match digit math occur before
                let val = ch.to_digit(10).unwrap();
                // apply sum rules, only on every second digits
                sum += if chars % 2 == 0 {
                    double_luhn_value(val)
                } else {
                    val
                }
            }
            // if space, do nothing
            ' ' => {}
            // if it's another char, it's not a valid one, return false early
            _ => return false,
        }
    }

    // ensure that after trims and all, char length is ok
    // if not, code is invalid
    if chars <= 1 {
        return false;
    }

    sum % 10 == 0
}

fn double_luhn_value(input: u32) -> u32 {
    let double = input * 2;
    if double < 9 {
        double
    } else {
        double - 9
    }
}
