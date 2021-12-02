use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;

fn read_lines<P>(filename: P) -> io::Result<io::Lines<io::BufReader<File>>>
where P: AsRef<Path>, {
    let file = File::open(filename)?;
    Ok(io::BufReader::new(file).lines())
}

fn part1() {
    let mut depth : u32 = 0;
    let mut h_dist : u32 = 0;
    if let Ok(lines) = read_lines("input.txt") {
        for line in lines {
            if let Ok(l) = line {
                let split = l.split(" ").collect::<Vec<&str>>();
                match split[0] {
                    "forward" => h_dist += split[1].parse::<u32>().unwrap(),
                    "up" => depth -= split[1].parse::<u32>().unwrap(),
                    "down" => depth += split[1].parse::<u32>().unwrap(),
                    _ => println!("unrecognized"),
                }
            }
        }
    }
    println!("--- Part 1 ---");
    println!("Horizontal distance: {}", h_dist);
    println!("Depth: {}", depth);
    println!("-> Product: {}\n", depth*h_dist);
}

fn part2() {
    let mut depth : u32 = 0;
    let mut h_dist : u32 = 0;
    let mut aim : u32 = 0;
    if let Ok(lines) = read_lines("input.txt") {
        for line in lines {
            if let Ok(l) = line {
                let split = l.split(" ").collect::<Vec<&str>>();
                match split[0] {
                    "forward" => {
                        h_dist += split[1].parse::<u32>().unwrap();
                        depth += aim*split[1].parse::<u32>().unwrap();
                    },
                    "up" => aim -= split[1].parse::<u32>().unwrap(),
                    "down" => aim += split[1].parse::<u32>().unwrap(),
                    _ => println!("unrecognized"),
                }
            }
        }
    }
    println!("--- Part 2 ---");
    println!("Horizontal distance: {}", h_dist);
    println!("Depth: {}", depth);
    println!("-> Product: {}\n", depth*h_dist);
}

fn main() {
    part1();
    part2();
}