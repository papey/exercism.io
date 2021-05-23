use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    possible_anagrams
        .iter()
        .fold(HashSet::new(), |mut acc, current| {
            if is_anagram(word, current) {
                acc.insert(current);
            }
            acc
        })
}

pub fn is_anagram(base: &str, candidate: &str) -> bool {
    // if not the same len, it's not an anagram
    if base.len() != candidate.len() {
        return false;
    }

    // ensure lowercase first
    let base_lower = base.to_lowercase();
    let candidate_lower = candidate.to_lowercase();

    // if words are the same, it's not an interesting anagram
    if base_lower == candidate_lower {
        return false;
    }

    // collect char into vec for each input words
    let mut base_chars: Vec<char> = base_lower.chars().collect();
    let mut candidate_chars: Vec<char> = candidate_lower.to_lowercase().chars().collect();

    // check for naive equality
    if base_chars == candidate_chars {
        return true;
    }

    // sort if naive equality fails
    base_chars.sort_unstable();
    candidate_chars.sort_unstable();

    // check for equality on sorted vecs
    candidate_chars == base_chars
}
