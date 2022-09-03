pub fn nth(n: u32) -> u32 {
    match n {
        0 => 2,
        1 => 3,
        _ => prime(n),
    }
}

fn prime(n: u32) -> u32 {
    let mut primes = vec![2, 3];
    let mut next = *primes.last().unwrap_or(&0) + 2;

    while primes.len() <= n as usize {
        if primes.iter().all(|&i| next % i != 0) {
            primes.push(next)
        }

        next += 2;
    }

    *primes.last().unwrap_or(&0)
}
