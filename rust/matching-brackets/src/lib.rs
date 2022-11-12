#[macro_use]
extern crate lazy_static;

use std::collections::HashMap;

lazy_static! {
    #[derive(Debug)]
    static ref MATCHING_BRACKETS: HashMap<char, char> = {
        let mut m = HashMap::new();
        m.insert(']', '[');
        m.insert('}', '{');
        m.insert(')', '(');
        m
    };
}

pub fn brackets_are_balanced(string: &str) -> bool {
    let mut stack: Vec<char> = vec![];

    for ch in string.chars() {
        if None != MATCHING_BRACKETS.values().find(|&&c| c == ch) {
            stack.push(ch);
        } else if let Some(&c) = MATCHING_BRACKETS.get(&ch) {
            if Some(c) != stack.pop() {
                return false;
            }
        }
    }

    stack.is_empty()
}
