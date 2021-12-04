# Split input into individual boards
def get_bingo_boards(input)
    result = []
    temp = []
    for line in input
        if line.length() == 0
            result.push(temp.dup)
            temp = []
        else
            temp.push(line.split().map(&:to_i))
        end
    end
    if temp.length() > 0 then result.push(temp) end
    return result
end

# Check whether a row, column, or diagonal has been completed
def check_board_complete(board)
    
    # horizontal check
    for row in board
        if row.all? { |x| x == -1 } then 
            return true 
        end 
    end

    # vertical check
    for i in 0..4
        all_marked = true
        for row in board
            if row[i] != -1
                all_marked = false
            end
        end
        if all_marked then return true end
    end
    
    # diagonal check
    for i in 0..4
        if board[i][i] != -1 then return false end
    end
    
    return true
end

# Return the index of the number that was just called when the board was solved
def get_board_win_index(numbers, board) 
    for n in 0..numbers.length()-1
        board.each { |row| row.collect! { |x| if x == numbers[n] then -1 else x end } } 
        if check_board_complete(board) then 
            return n
        end
    end
end

def get_score(number, board)
    sum = 0
    for row in board 
        for x in row 
            if x != -1 then sum += x end
        end
    end
    return number * sum
end

input = ARGF.readlines.map(&:chomp)

numbers = input[0].split(',').map(&:to_i)
boards = get_bingo_boards(input.drop(2))

winning_indices = boards.map{ |board| get_board_win_index(numbers, board) }

# Part 1
first_winning_index = winning_indices.min
puts get_score(numbers[first_winning_index], boards[winning_indices.index(first_winning_index)])

# Part 2
last_winning_index = winning_indices.max
puts get_score(numbers[last_winning_index], boards[winning_indices.index(last_winning_index)])
