data = ARGF.gets_to_end.chomp.split("\n").map{|x|x.split("")}

count = 0
sum = 0
low_points = [] of Array(Int32)
data.each_with_index do |l,li|
    l.each_with_index do |c,ci| 
        lower = true
        if !li.zero? && data[li-1][ci] <= c
            lower = false
        elsif li != data.size-1 && data[li+1][ci] <= c
            lower = false
        end
        if !ci.zero? && l[ci-1] <= c
            lower = false
        elsif ci != l.size-1 && l[ci+1] <= c
            lower = false
        end
        if lower
            count += 1
            sum += c.to_i+1
            low_points.push([li,ci])
        end
    end
end

puts "Part 1:\nThere were %d low-points\nTheir sum was %d\n\n" % [count, sum]

def traverse(li,ci,visited,data)
    if li < 0 || ci < 0 || li >= visited.size || ci >= visited[0].size || visited[li][ci] || data[li][ci] == "9"
        return 0
    end
    visited[li][ci] = true
    current_size = 1
    current_size += traverse(li+1,ci,visited,data)
    current_size += traverse(li-1,ci,visited,data)
    current_size += traverse(li,ci+1,visited,data)
    current_size += traverse(li,ci-1,visited,data)
    return current_size
end

puts "Part 2: %d\n\n" % [low_points.map { |lp| traverse(lp[0], lp[1], data.map { |x| x.map { |y| false } }, data) }.sort.last(3).product]