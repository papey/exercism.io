#[derive(PartialOrd, Ord, PartialEq, Eq)]
enum Suit {
    Spade,
    Club,
    Diamond,
    Heart,
}

const AS_VALUE: u32 = 14;
const KING_VALUE: u32 = 13;
const QUEEN_VALUE: u32 = 12;
const JACK_VALUE: u32 = 11;

fn parse_rank(rank: char) -> u32 {
    match rank {
        'A' => AS_VALUE,
        'K' => KING_VALUE,
        'Q' => QUEEN_VALUE,
        'J' => JACK_VALUE,
        // unwraping is ok here since inputs are all valid
        digit => digit.to_digit(10).unwrap(),
    }
}

fn parse_suit(suit: char) -> Suit {
    match suit {
        'S' => Suit::Spade,
        'C' => Suit::Club,
        'D' => Suit::Diamond,
        'H' => Suit::Heart,
        _ => panic!("unkown suit: {}", suit),
    }
}

#[derive(PartialOrd, Ord, PartialEq, Eq)]
struct Card {
    rank: u32,
    suit: Suit,
}

impl Card {
    pub fn new(text: &str) -> Self {
        let parts = text.chars().collect::<Vec<char>>();
        // if len is 3, then it's a 10X card
        if parts.len() == 3 {
            return Card {
                rank: 10,
                suit: parse_suit(parts[2]),
            };
        }

        Card {
            rank: parse_rank(parts[0]),
            suit: parse_suit(parts[1]),
        }
    }
}

#[derive(Debug, Eq, PartialEq, Ord, PartialOrd)]
// sorted by power, in order to use derived traits directly on the enum
enum Hand {
    HighCard(u32, u32, u32, u32, u32),
    OnePair(u32, u32, u32, u32),
    TwoPair(u32, u32, u32),
    ThreeOfAKind(u32, u32, u32),
    Straight(u32),
    Flush(u32, u32, u32, u32, u32),
    FullHouse(u32, u32),
    FourOfAKind(u32, u32),
    StraightFlush(u32),
}

impl Hand {
    pub fn new(cards: &mut [Card]) -> Self {
        // sort cards by power value
        cards.sort_unstable_by(|a, b| b.cmp(a));
        // groups cards to find triple or pairs
        let groups = grouping(cards);
        match (
            Self::is_flush(cards),
            Self::is_straight(cards),
            groups[0].quantity,
            groups[1].quantity,
        ) {
            (true, true, _, _) => Hand::StraightFlush(cards[4].rank),
            (false, true, _, _) => Hand::Straight(match cards[0].rank {
                14 => 5,
                v => v,
            }),
            (true, false, _, _) => Hand::Flush(
                cards[0].rank,
                cards[1].rank,
                cards[2].rank,
                cards[3].rank,
                cards[4].rank,
            ),
            (_, _, 4, _) => Hand::FourOfAKind(groups[0].rank, groups[1].rank),
            (_, _, 3, 2) => Hand::FullHouse(groups[0].rank, groups[1].rank),
            (_, _, 3, _) => Hand::ThreeOfAKind(groups[0].rank, groups[1].rank, groups[2].rank),
            (_, _, 2, 2) => Hand::TwoPair(groups[0].rank, groups[1].rank, groups[2].rank),
            (_, _, 2, _) => Hand::OnePair(
                groups[0].rank,
                groups[1].rank,
                groups[2].rank,
                groups[3].rank,
            ),
            _ => Hand::HighCard(
                cards[0].rank,
                cards[1].rank,
                cards[2].rank,
                cards[3].rank,
                cards[4].rank,
            ),
        }
    }

    fn is_flush(cards: &[Card]) -> bool {
        cards
            .windows(2)
            .all(|subhand| subhand[0].suit == subhand[1].suit)
    }

    fn is_straight(cards: &[Card]) -> bool {
        cards.windows(2).all(|subhand| {
            subhand[0].rank == subhand[1].rank + 1 || (subhand[0].rank, subhand[1].rank) == (14, 5)
        })
    }
}

#[derive(PartialOrd, Ord, PartialEq, Eq)]
struct Group {
    quantity: u32,
    rank: u32,
}

fn grouping(cards: &[Card]) -> Vec<Group> {
    let mut groups = (2..=14)
        .filter_map(|rank| {
            let count = cards.iter().filter(|card| card.rank == rank).count();
            if count != 0 {
                return Some(Group {
                    quantity: count as u32,
                    rank: rank,
                });
            }
            None
        })
        .collect::<Vec<Group>>();

    groups.sort_unstable_by(|a, b| b.cmp(a));
    groups
}

struct SortableHand<'a> {
    hand: Hand,
    raw: &'a str,
}

/// Given a list of poker hands, return a list of those hands which win.
///
/// Note the type signature: this function should return _the same_ reference to
/// the winning hand(s) as were passed in, not reconstructed strings which happen to be equal.
pub fn winning_hands<'a>(hands: &[&'a str]) -> Option<Vec<&'a str>> {
    // if no hands, return none
    if hands.len() == 0 {
        return None;
    }

    // if only one hand, return the hand directly
    if hands.len() == 1 {
        return Some(vec![hands[0]]);
    }

    // parse inputs into sortable hands
    let mut sortable_hands = hands
        .into_iter()
        .map(|text| {
            let mut cards = text
                .split_whitespace()
                .map(Card::new)
                .collect::<Vec<Card>>();
            SortableHand {
                hand: Hand::new(&mut cards),
                raw: text,
            }
        })
        .collect::<Vec<SortableHand>>();

    // do the sorting
    sortable_hands.sort_unstable_by(|a, b| b.hand.cmp(&a.hand));

    // collect all hands represented as str pointer with the same score
    Some(
        sortable_hands
            .iter()
            .take_while(|hand| hand.hand.eq(&sortable_hands[0].hand))
            .map(|hand| hand.raw)
            .collect(),
    )
}
