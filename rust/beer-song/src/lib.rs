pub fn verse(n: u32) -> String {
    let current = bottles(n);
    format!(
        "{b1} of beer on the wall, {b2} of beer.\n{take}, {rest} of beer on the wall.\n",
        b1 = capitalize(&current),
        b2 = current,
        take = todo(n),
        rest = if n == 0 { bottles(99) } else { bottles(n - 1) }
    )
}

pub fn sing(start: u32, end: u32) -> String {
    (end..=start)
        .rev()
        .map(|x| verse(x))
        .collect::<Vec<String>>()
        .join("\n")
}

fn capitalize(sentence: &String) -> String {
    let mut letters = sentence.chars();
    match letters.next() {
        Some(letter) => format!("{}{}", letter.to_uppercase(), letters.as_str()),
        None => String::new(),
    }
}

fn bottles(n: u32) -> String {
    match n {
        0 => "no more bottles".to_string(),
        1 => "1 bottle".to_string(),
        value => format!("{} bottles", value),
    }
}

fn todo(n: u32) -> String {
    match n {
        0 => "Go to the store and buy some more".to_string(),
        1 => "Take it down and pass it around".to_string(),
        _ => "Take one down and pass it around".to_string(),
    }
}
