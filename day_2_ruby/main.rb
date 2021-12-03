def part1(input) 
    depth = 0
    h_dist = 0
    input.each do |direction,amount|
        case direction
        when "up"
            depth -= amount.to_i()
        when "down"
            depth += amount.to_i()
        when "forward"
            h_dist += amount.to_i()
        end
    end
    puts "Part 1\nHorizontal distance: %d\nDepth: %d \n-> Product: %d\n\n" % [h_dist, depth, h_dist*depth]
end

def part2(input) 
    depth = 0
    h_dist = 0
    aim = 0
    input.each do |direction,amount|
        case direction
        when "up"
            aim -= amount.to_i()
        when "down"
            aim += amount.to_i()
        when "forward"
            h_dist += amount.to_i()
            depth += aim*amount.to_i()
        end
    end
    puts "Part 2\nHorizontal distance: %d\nDepth: %d \n-> Product: %d\n\n" % [h_dist, depth, h_dist*depth]
end

input = ARGF.readlines.map(&:chomp).map(&:split)
part1(input)
part2(input)