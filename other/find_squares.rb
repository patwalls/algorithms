# find all of the squares in the 2d Array

array = [
  [1,1,1,1,0,0,0,1],
  [1,1,1,1,0,0,0,1],
  [1,0,0,1,1,1,1,1],
  [1,0,0,1,1,0,1,1],
  [1,1,1,1,1,1,1,1],
]

def find_squares(array)
  squares = []
  array.length.times do |row|
    array[0].length.times do |column|
      if array[row][column] == 0
        squares << find_rest_of_square(array,[row,column]) if !already_in_square(squares,[row,column])
      end
    end
  end

  return squares
end

def already_in_square(squares,coord)
  x,y = coord
  squares.each do |square|
    top_left = square[0]
    bottom_right = square[1]
    if ((x >= top_left[0] && x <= bottom_right[0]) && (y >= top_left[1] && y <= bottom_right[1]))
      return true
    end
  end
  return false
end

def find_rest_of_square(array,coord)
  x,y = coord
  max_down,max_across = coord
  until array[x][max_across + 1] == 1
    max_across += 1
  end
  until array[max_down + 1][y] == 1
    max_down += 1
  end
  [[x,y],[max_down,max_across]]
end

p find_squares(array)
