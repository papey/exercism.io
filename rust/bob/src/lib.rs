use regex::Regex;

pub fn reply(message: &str) -> &str {
    let is_question = is_match(message, r"\?\s*$");
    let is_shouting = message == message.to_uppercase() && message != message.to_lowercase();
    let is_silence = is_match(message, r"^\s*$");

    match (is_question, is_shouting, is_silence) {
        (_, _, true) => "Fine. Be that way!",
        (true, true, _) => "Calm down, I know what I'm doing!",
        (_, true, _) => "Whoa, chill out!",
        (true, _, _) => "Sure.",
        _ => "Whatever.",
    }
}

fn is_match(message: &str, re: &str) -> bool {
    let re: Regex = Regex::new(re).unwrap();
    re.is_match(message)
}
