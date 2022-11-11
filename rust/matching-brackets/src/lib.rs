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

static OPENING_BRACKETS: [char; 3] = ['[', '{', '('];

pub fn brackets_are_balanced(string: &str) -> bool {
    let mut stack: Vec<char> = vec![];

    for ch in string.chars() {
        if OPENING_BRACKETS.contains(&ch) {
            stack.push(ch);
            continue;
        }

        if MATCHING_BRACKETS.contains_key(&ch) {
            if let Some(opening) = stack.pop() {
                if opening == MATCHING_BRACKETS[&ch] {
                    continue;
                }
            }

            return false;
        }
    }

    stack.len() == 0
}
