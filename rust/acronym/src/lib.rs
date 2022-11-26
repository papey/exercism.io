use regex::Regex;

const SPLIT_REGEX: &str = r"(\s|\-)";
const SANITIZE_REGEX: &str = r"(,|_)";

pub fn abbreviate(phrase: &str) -> String {
    Regex::new(SPLIT_REGEX)
        .unwrap()
        .split(&Regex::new(SANITIZE_REGEX).unwrap().replace_all(phrase, ""))
        .flat_map(|word| {
            word.chars().take(1).chain(
                word.chars()
                    .skip(1)
                    .skip_while(|c| c.is_ascii_uppercase())
                    .filter(|c| c.is_ascii_uppercase()),
            )
        })
        .map(|l| l.to_ascii_uppercase())
        .collect()
}
