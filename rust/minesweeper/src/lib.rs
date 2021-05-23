use itertools::Itertools;
use std::char;

// Mine char value
const MINE: char = '*';

pub fn annotate(minefield: &[&str]) -> Vec<String> {
    match minefield {
        [] => vec![],
        [""] => vec![String::new()],

        mf => {
            // save height and width
            let h = mf.len() as i8;
            let w = mf[0].len() as i8;
            // map on lines
            (0..h)
                .map(|y| {
                    // map on cols
                    (0..w)
                        .map(move |x| {
                            // string is ascii only, as_bytes and as u8 is ok here
                            // if it's mine, keep it as a mine
                            if mf[y as usize].as_bytes()[x as usize] == (MINE as u8) {
                                MINE
                            }
                            // if not
                            else {
                                // check all direction
                                let res = (-1..=1)
                                    .cartesian_product(-1..=1)
                                    .filter(|coord| *coord != (0, 0))
                                    // map current pos to shifted pos
                                    .map(|(dy, dx)| (dy + y, dx + x))
                                    // filter elements to keep coords inside map bounds
                                    .filter(|(y, x)| {
                                        // beware of the bounds !
                                        (*y >= 0 && *y <= h - 1) && (*x >= 0 && *x <= w - 1)
                                    })
                                    // filter elements that represents mines
                                    .filter(|(y, x)| {
                                        mf[*y as usize].as_bytes()[*x as usize] == (MINE as u8)
                                    })
                                    // count all mines
                                    .count();

                                match res {
                                    // if no mines, return empty space
                                    0 => ' ',
                                    // unwrapping is ok here since res is a number
                                    n => char::from_digit(n as u32, 10).unwrap(),
                                }
                            }
                        })
                        // collect all chars into a string
                        .collect()
                })
                // collect all strings into a Vec<String>
                .collect::<Vec<String>>()
        }
    }
}
