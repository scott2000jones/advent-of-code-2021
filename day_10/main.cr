ERROR_COSTS = {
    ')' => 3,
    ']' => 57,
    '}' => 1197,
    '>' => 25137,
}

AUTOCOMPLETE_POINTS = {
    ')' => 1,
    ']' => 2,
    '}' => 3,
    '>' => 4,
}

EXPECTS = {
    '(' => ')',
    '[' => ']',
    '{' => '}',
    '<' => '>',
}

lines = ARGF.gets_to_end.chomp.split("\n")

error_score = 0
autocomplete_scores = [] of UInt128
lines.each do |l|
    expecting = [] of Char
    corrupted = false
    l.each_char do |c|
        if !expecting.empty? && c != expecting[-1] && !EXPECTS.has_key?(c)
            if ERROR_COSTS.has_key?(c)
                error_score += ERROR_COSTS[c]
            end
            corrupted = true
            break
        elsif EXPECTS.has_key?(c)
            expecting.push(EXPECTS[c])
        else
            expecting.pop
        end
    end
    if !corrupted && !expecting.empty? 
        temp_score = 0.to_u128
        expecting.reverse.each do |e|
            temp_score = temp_score * 5
            temp_score += AUTOCOMPLETE_POINTS[e]
        end
        autocomplete_scores.push(temp_score)
    end
end
puts "Part 1:\nTotal syntax error score: #{error_score}"
puts "Part 2:\nTotal autocomplete score: #{autocomplete_scores.sort[autocomplete_scores.size.tdiv(2)]}\n"
