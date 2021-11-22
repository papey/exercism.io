pub fn nth(n: u32) -> u32 {
    (2..).filter(|c| is_prime(*c)).nth(n as usize).unwrap()
}

fn is_prime(n: u32) -> bool {
    !(2..n - 1).any(|i| n % i == 0)
}
