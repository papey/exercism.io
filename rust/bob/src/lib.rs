const QUESTION_MARK: char = '?';

const SHOUTING_REPLY: &str = "Whoa, chill out!";
const DEFAULT_REPLY: &str = "Whatever.";
const QUESTION_REPLY: &str = "Sure.";
const SILENCE_REPLY: &str = "Fine. Be that way!";
const SOUTHING_QUESTION_REPLY: &str = "Calm down, I know what I'm doing!";

pub fn reply(message: &str) -> &str {
    let sanitized = message.trim();
    let is_question = sanitized.ends_with(QUESTION_MARK);
    let is_shouting =
        sanitized.chars().any(char::is_alphabetic) && message == message.to_uppercase();
    let is_silence = sanitized.is_empty();

    match (is_question, is_shouting, is_silence) {
        (_, _, true) => SILENCE_REPLY,
        (true, true, _) => SOUTHING_QUESTION_REPLY,
        (_, true, _) => SHOUTING_REPLY,
        (true, _, _) => QUESTION_REPLY,
        _ => DEFAULT_REPLY,
    }
}
