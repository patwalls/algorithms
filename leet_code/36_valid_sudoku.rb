def is_valid_sudoku(board)
    board.length.times do |row|
        board.length.times do |column|
            next if board[row][column] == '.'
            return false if !check_square(board,[row,column])
            return false if !check_row_and_col(board,[row,column])
        end
    end
    return true
end

def check_square(board,coord)
  x,y = coord
  locations = [[0,1,2],[3,4,5],[6,7,8]]
  x_checks = locations.select { |location| location.include?(x) }.flatten
  y_checks = locations.select { |location| location.include?(y) }.flatten
  x_checks.each do |x2|
    y_checks.each do |y2|
      next if x == x2 && y == y2
      return false if board[x][y] == board[x2][y2]
    end
  end
  return true
end

def check_row_and_col(board,coord)
  x,y = coord
  x_check = 0
  y_check = 0
  while x_check < 9
    return false if board[x_check][y] == board[x][y] && !(x_check == x)
    x_check += 1
  end
  while y_check < 9
    return false if board[x][y_check] == board[x][y] && !(y_check == y)
    y_check += 1
  end
  return true
end

p is_valid_sudoku([".87654321","2........","3........","4........","5........","6........","7........","8........","9........"])
