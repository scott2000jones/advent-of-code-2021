# hash tracks number of fish at each possible age
h = ARGF.readlines.map(&:chomp)[0].split(",").map(&:to_i).tally 
h.default = 0

# iterate through 256 days
256.times do |i|
    h.transform_keys! { |x| x-1 }
    h[8] = h[-1]
    h[6] += h[-1]
    h[-1] = 0
    if i == 79 then puts "Part 1: %d fish\n" % [h.values.compact.sum] end # print part1 at 80th iteration (i=79)
end
puts "Part 2: %d fish\n" % [h.values.compact.sum] 
