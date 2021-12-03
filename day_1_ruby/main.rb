input = ARGF.readlines.map(&:chomp).map(&:to_i)
puts "Part1: %d increases\n" % [input.each_cons(2).select{ |a,b| a < b }.count]
puts "Part2: %d increases\n" % [input.each_cons(3).map(&:sum).each_cons(2).select{ |a,b| a < b }.count]