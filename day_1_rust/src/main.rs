use std::fs::*;

fn part1(values: &Vec<u32>) -> u32 {
    let mut increase_count : u32 = 0;
    let mut prev : u32 = u32::MIN;
    for current in values {
        // println!("Comparing {} to prev {} ", current, prev);
        if *current > prev && prev > u32::MIN {
            increase_count += 1;
        }
        prev = *current;
    }
    return increase_count;
}

fn part2(values: &Vec<u32>) -> u32 {
    let mut increase_count : u32 = 0;    
    let mut prev_sum : u32 = u32::MIN;
    for w in values.windows(3) {
        let new_sum = w.iter().sum();
        // println!("{}", new_sum);
        if new_sum > prev_sum && prev_sum > u32::MIN {
            increase_count += 1;
            // println!("  increased!");
        }
        prev_sum = new_sum;
    }
    return increase_count;
}

fn main() {
    let input_file = read_to_string("input.txt")
        .expect("Cannot read the file");
    let values: Vec<u32> = input_file.lines()
        .map(|line| line.parse().expect("Cannot parse"))
        .collect();

    println!("Part1 result: {} increases", part1(&values));
    println!("Part2 result: {} increases", part2(&values));
}