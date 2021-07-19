const DROPS: [(u32, &str); 3] = [(3, "Pling"), (5, "Plang"), (7, "Plong")];

fn is_factor(n: u32, factor: u32) -> bool {
    n % factor == 0
}

pub fn raindrops(n: u32) -> String {
    let sounds = DROPS
        .iter()
        .filter_map(|(drop, sound)| is_factor(n, *drop).then(|| *sound))
        .collect::<String>();

    if !sounds.is_empty() {
        return sounds;
    }

    n.to_string()
}
