pub fn reply(message: &str) -> &str {
    let sanitized = message.trim();
    let is_question = sanitized.ends_with("?");
    let is_shouting = message == message.to_uppercase() && message != message.to_lowercase();
    let is_silence = sanitized == "";

    match (is_question, is_shouting, is_silence) {
        (_, _, true) => "Fine. Be that way!",
        (true, true, _) => "Calm down, I know what I'm doing!",
        (_, true, _) => "Whoa, chill out!",
        (true, _, _) => "Sure.",
        _ => "Whatever.",
    }
}
