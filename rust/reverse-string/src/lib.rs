extern crate unicode_segmentation;

use unicode_segmentation::UnicodeSegmentation;

// with unicode-segmentation
pub fn reverse(input: &str) -> String {
    UnicodeSegmentation::graphemes(input, true).fold(String::new(), |acc, c| c.to_string() + &acc)
}

// not handling grapheme correctly
pub fn _reverse(input: &str) -> String {
    input
        .chars()
        .fold(String::new(), |acc, c| c.to_string() + &acc)
}
