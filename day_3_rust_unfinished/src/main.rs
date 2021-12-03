use std::env;
use std::fs::*;

fn part1(values: &Vec<&str>, num_bits: usize) -> u32 {
    let mut counts : Vec<Vec<u32>> = vec![];

    for bit in 0..num_bits {
        counts.push(vec![]);
        for string in values {
            counts[bit].push(string.chars().nth(bit).unwrap().to_digit(10).unwrap());
        }
    }

    println!("counts {:?}", counts);
    1
}

fn main() {
    let args: Vec<_> = env::args().collect();
    println!("{:?}", args);
    let input_file = read_to_string(env::args().nth(1).expect("Missing argument"))
        .expect("Cannot read the file");
    let values: Vec<&str> = input_file.lines()
        .map(|s| s.trim())
        .collect();

    println!("{:?}", values);
    println!("{:?}", part1(&values, 5));
}