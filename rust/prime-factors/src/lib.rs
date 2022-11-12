pub fn factors(n: u64) -> Vec<u64> {
    let mut current = n;
    let mut prime = 2;
    let mut primes: Vec<u64> = vec![];

    while current != 1 {
        if current % prime == 0 {
            current /= prime;
            primes.push(prime);
        } else {
            prime += 1;
        }
    }

    primes
}
