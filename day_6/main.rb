h = Hash.new(0) # hash tracks number of fish at each possible age
ARGF.readlines.map(&:chomp)[0].split(",").map(&:to_i).each do |v|
    h[v] += 1
end

# iterate through 256 days
(1..256).each do |i|
    num_to_push = h[0]
    (1..8).each do |v|
        h[v-1] = h[v]
    end
    h[6] += num_to_push
    h[8] = num_to_push
    if i == 80 then 
        sum = 0
        h.each do |k, v| sum += v end
        puts "Part 1: %d fish\n" % [sum] 
    end
end
sum = 0
h.each do |k, v| sum += v end
puts "Part 2: %d fish\n" % [sum] 
