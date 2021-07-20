pub fn build_proverb(list: &[&str]) -> String {
    if list.len() == 0 {
        return String::from("");
    }

    list.windows(2)
        .map(|item| format!("For want of a {} the {} was lost.", item[0], item[1]))
        .chain(std::iter::once(format!(
            "And all for the want of a {}.",
            list[0]
        )))
        .collect::<Vec<String>>()
        .join("\n")
}
