#[derive(Debug, PartialEq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(first_list: &[T], second_list: &[T]) -> Comparison {
    match (first_list.len(), second_list.len()) {
        (0, 0) => Comparison::Equal,
        (0, _) => Comparison::Sublist,
        (_, 0) => Comparison::Superlist,

        (l1, l2) if l1 > l2 => {
            if first_list.windows(l2).any(|v| v == second_list) {
                Comparison::Superlist
            } else {
                Comparison::Unequal
            }
        }

        (l1, l2) if l1 < l2 => {
            if second_list.windows(l1).any(|v| v == first_list) {
                Comparison::Sublist
            } else {
                Comparison::Unequal
            }
        }

        (_, _) => {
            if first_list == second_list {
                Comparison::Equal
            } else {
                Comparison::Unequal
            }
        }
    }
}
