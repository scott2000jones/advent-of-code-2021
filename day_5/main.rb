input = ARGF.readlines.map(&:chomp).map{ |i| i.split(" -> ").map{ |j| j.split(",") } }

def part1(input)
    h = Hash.new(0)
    for line in input
        x1 = line[0][0].to_i
        y1 = line[0][1].to_i
        x2 = line[1][0].to_i
        y2 = line[1][1].to_i

        if x1 == x2 
            if y1 < y2 
                y1.upto(y2) do |i|
                    h[[x1, i]] += 1
                end
            else
                y1.downto(y2) do |i|
                    h[[x1, i]] += 1
                end
            end
        elsif y1 == y2
            if x1 < x2 
                x1.upto(x2) do |i|
                    h[[i, y1]] += 1
                end
            else
                x1.downto(x2) do |i|
                    h[[i, y1]] += 1
                end
            end
        end
    end
    return h.select {|k,v| v >= 2}.count
end

def part2(input)
    h = Hash.new(0)
    for line in input
        x1 = line[0][0].to_i
        y1 = line[0][1].to_i
        x2 = line[1][0].to_i
        y2 = line[1][1].to_i

        xrange = (x1..x2).to_a
        if x1 > x2 then xrange = (x2..x1).to_a.reverse end
        yrange = (y1..y2).to_a
        if y1 > y2 then yrange = (y2..y1).to_a.reverse end
        max_length =  xrange.length() > yrange.length() ? xrange.length() : yrange.length()

        for i in 0..max_length-1
            xc = xrange[0]
            if i < xrange.length() then xc = xrange[i] end
            yc = yrange[0]
            if i < yrange.length() then yc = yrange[i] end
            h[[xc, yc]] += 1
        end
    end
    return h.select {|k,v| v >= 2}.count
end

puts "Part 1: %d\n" % [part1(input)]
puts "Part 2: %d\n" % [part2(input)]
