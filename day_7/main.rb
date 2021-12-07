crabs = ARGF.readlines.map(&:chomp)[0].split(?,).map(&:to_i)
puts "Part 1: %d fuel\n" % [(crabs.min..crabs.max).map { |i| crabs.map { |j| (i-j).abs }.sum }.min]
puts "Part 2: %d fuel\n" % [(crabs.min..crabs.max).map { |i| crabs.map { |j| ->(n){(n**2 + n)/2}.((i-j).abs) }.sum }.min]
