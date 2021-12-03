NUM_BITS = 12

def part1(input) 
    gamma = ''
    epsilon = ''
    for bit in 0..NUM_BITS-1
        if input.map {|s| s[bit]}.tally.max_by{|k,v| v}[0] == '1'
            gamma.concat('1')
            epsilon.concat('0')
        else
            gamma.concat('0')
            epsilon.concat('1')
        end
    end
    puts "Gamma: %s (%d)\nEpsilon: %s (%d)\nProduct => %d\n\n" % [
            gamma, gamma.to_i(2), epsilon, epsilon.to_i(2), gamma.to_i(2)*epsilon.to_i(2)
        ]
end

def part2(input)
    o2 = filter(input, 'oxygen')
    co2 = filter(input, 'carbon')
    puts "Oxygen: %s (%d)\nCarbon: %s (%d)\nProduct => %d\n\n" % [o2, o2.to_i(2), co2, co2.to_i(2), o2.to_i(2)*co2.to_i(2)]
end

def filter(input, looking_for)
    for bit in 0..NUM_BITS-1
        tallies = input.map {|s| s[bit]}.tally
        target = tallies.max_by{|k,v| v}[0]
        if looking_for == 'carbon' then target = tallies.min_by{|k,v| v}[0] end
        if tallies['1'] == tallies ['0'] 
            if looking_for == 'oxygen'
                target = '1'
            else
                target = '0'
            end
        end
        filtered = input.select {|s| s[bit] == target}
        if filtered.length() == 1
            return filtered[0]
        else
            input = filtered
        end
    end
end

input = ARGF.readlines.map(&:chomp)
part1(input)
part2(input)



