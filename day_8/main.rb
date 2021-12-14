Mapping = {
  0 => 'abcefg',
  1 => 'cf',
  2 => 'acdeg',
  3 => 'acdfg',
  4 => 'bcdf',
  5 => 'abdfg',
  6 => 'abdefg',
  7 => 'acf',
  8 => 'abcdefg',
  9 => 'abcdfg'
}

# since 1,4,7,8 all have unique lengths, we can just use those and completely disregard the letters used to represent them
Targets = [1,4,7,8].map{|t| Mapping[t].size}

puts "Part 1: %d\n" % [ARGF.readlines.map(&:chomp).map { |x| x.split(?|).last.split.map(&:size).select{ |y| Targets.include? y }.count }.sum]






# First we identify segment a. This must be the character that the 3-character string has but the 2-character string does not.

# We then notice that we can identify segments b, c, e, and f as each is used in a unique number of the 10 digits:

# segment a appears in 8 digits

# segment b appears in 6 digits

# segment c appears in 8 digits (and we already know a)

# segment d appears in 7 digits

# segment e appears in 4 digits

# segment f appears in 9 digits

# segment g appears in 7 digits

# Now that we know b, c, and f we can identify d, it is the unaccounted-for character in the 4-character string

# And since we know a, b, c, d, e, and f, we know the last character corresponds to g.