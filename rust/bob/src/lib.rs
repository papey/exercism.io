const SHOUTING_REPLY: &str = "Whoa, chill out!";
const DEFAULT_REPLY: &str = "Whatever.";
const QUESTION_REPLY: &str = "Sure.";
const SILENCE_REPLY: &str = "Fine. Be that way!";
const SOUTHING_QUESTION_REPLY: &str = "Calm down, I know what I'm doing!";

pub fn reply(message: &str) -> &str {
    let sanitized = message.trim();
    let is_question = sanitized.ends_with('?');
    let is_shouting =
        sanitized.chars().any(char::is_alphabetic) && message == message.to_uppercase();

    if sanitized.is_empty() {
        return SILENCE_REPLY;
    }

    match (is_question, is_shouting) {
        (true, true) => SOUTHING_QUESTION_REPLY,
        (_, true) => SHOUTING_REPLY,
        (true, _) => QUESTION_REPLY,
        _ => DEFAULT_REPLY,
    }
}
