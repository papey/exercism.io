const DROPS: [(u32, &str); 3] = [(3, "Pling"), (5, "Plang"), (7, "Plong")];

fn is_factor(n: u32, factor: u32) -> bool {
    n % factor == 0
}

pub fn raindrops(n: u32) -> String {
    let sounds = DROPS
        .iter()
        .filter_map(|(drop, sound)| {
            if is_factor(n, *drop) {
                return Some(*sound);
            }
            None
        })
        .collect::<Vec<&str>>();

    if !sounds.is_empty() {
        return sounds.join("");
    }

    n.to_string()
}
