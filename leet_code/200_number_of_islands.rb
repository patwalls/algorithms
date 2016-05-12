require 'byebug'

islands_array = [
  [0,0,1,0,0],
  [0,1,1,1,0],
  [0,0,1,0,0],
  [1,0,1,0,1]
]


def find_islands(islands_array)
  islands_hash = Hash.new
  islands = 0
  islands_array.length.times do |row|
    islands_array[0].length.times do |col|
      island_str = convert_coord_to_string(row,col)
      if islands_array[row][col] == 1 && !islands_hash[island_str]
        find_surrounding_land(row,col,islands_hash,islands_array)
        islands += 1
      else
        islands_hash[island_str] = false
      end
    end
  end
  p islands_hash
  islands
end

def find_surrounding_land(row,col,islands_hash,islands_array)
  return nil if row < 0 || col < 0 || row > islands_array.length - 1 || col > islands_array[0].length - 1
  island_str = convert_coord_to_string(row,col)
  return nil if islands_hash[island_str] || islands_array[row][col] == 0
  islands_hash[island_str] = true
  find_surrounding_land(row - 1, col, islands_hash, islands_array)
  find_surrounding_land(row + 1, col, islands_hash, islands_array)
  find_surrounding_land(row, col - 1, islands_hash, islands_array)
  find_surrounding_land(row, col + 1, islands_hash, islands_array)
end

def convert_coord_to_string(row,col)
  row.to_s + ',' + col.to_s
end

p find_islands(islands_array)
# => 3
