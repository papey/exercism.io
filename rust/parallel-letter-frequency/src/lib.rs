use std::collections::HashMap;
use std::thread;

type FreqCounter = HashMap<char, usize>;

pub fn frequency(input: &[&str], worker_count: usize) -> HashMap<char, usize> {
    // final result HashMap
    let mut res: FreqCounter = HashMap::new();

    // if empty, return empty hash map
    if input.is_empty() {
        return res;
    }

    // workers logic, task seperation
    let work_len = (input.len() / worker_count).max(1);
    let worker_count = work_len.min(worker_count);
    // init workers, type inference is ok here but I wanted some practice
    let mut workers: Vec<thread::JoinHandle<FreqCounter>> = Vec::with_capacity(worker_count);

    // for all chunks
    for count in 0..worker_count {
        // compute slice indexes
        let begin = work_len * count;
        // give extra work to last worker
        let end = if count == worker_count - 1 {
            input.len()
        } else {
            work_len * count + work_len
        };

        let local_data: Vec<String> = input[begin..end].iter().map(|c| String::from(*c)).collect();

        // spawn workers, no local_data data races
        workers.push(thread::spawn(move || {
            // for all chars (lowered)
            local_data
                .iter()
                .fold(HashMap::new(), |mut acc: FreqCounter, sentence| {
                    // match on counted chars
                    sentence
                        .chars()
                        .filter(|c| c.is_alphabetic())
                        .for_each(|ch| *acc.entry(ch.to_ascii_lowercase()).or_insert(0) += 1);
                    acc
                })
        }))
    }

    // for each workers
    for worker in workers {
        // wait for finish
        match worker.join() {
            Ok(lres) => {
                // iter on each k,v and sum all
                lres.iter().for_each(|(k, v)| {
                    *res.entry(*k).or_insert(0) += v;
                })
            }
            Err(_) => panic!("Houston, we have a problem."),
        }
    }

    res
}
