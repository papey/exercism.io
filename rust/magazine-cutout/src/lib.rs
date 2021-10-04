use std::collections::HashMap;

pub fn can_construct_note(magazine: &[&str], note: &[&str]) -> bool {
    let mag_words = group_words(magazine);
    let note_words = group_words(note);
    note_words
        .into_iter()
        .all(|(word, times)| mag_words.get(&word).unwrap_or(&0) >= &times)
}

fn group_words<'a>(content: &[&'a str]) -> HashMap<String, u32> {
    content.iter().fold(HashMap::new(), |mut acc, word| {
        *acc.entry(String::from(*word)).or_insert(0) += 1;
        acc
    })
}
