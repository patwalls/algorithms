def spiral_order(matrix)
  result_arr = []
  spiral = 0
  horizontal_size = matrix[0].length - 1
  vertical_size = matrix.length - 1
  while spiral == 0 || spiral < (vertical_size + 1) / 2
    result_arr << matrix[spiral][spiral]
    result_arr.concat(top(matrix,spiral,horizontal_size,vertical_size))
    result_arr.concat(right(matrix,spiral,horizontal_size,vertical_size)) unless matrix.length == 1
    result_arr.concat(bottom(matrix,spiral,horizontal_size,vertical_size)) unless matrix.length == 1
    result_arr.concat(left(matrix,spiral,horizontal_size,vertical_size)) unless matrix.length == 1
    spiral += 1
  end
  result_arr << matrix[spiral][spiral] if matrix.length % 2 != 0 && matrix.length != 1
  result_arr
end

def top(matrix,spiral,h_size,v_size)
  result = []
  (spiral + 1..h_size - spiral).to_a.each do |j|
    result << matrix[spiral][j]
  end
  result
end

def right(matrix,spiral,h_size,v_size)
  result = []
  (spiral + 1..v_size - spiral).to_a.each do |i|
    result << matrix[i][h_size - spiral]
  end
  result
end

def bottom(matrix,spiral,h_size,v_size)
  result = []
  (spiral..h_size - spiral - 1).to_a.reverse.each do |j|
    result << matrix[v_size - spiral][j]
  end
  result
end

def left(matrix,spiral,h_size,v_size)
  result = []
  (spiral + 1..v_size - spiral - 1).to_a.reverse.each do |i|
    result << matrix[i][spiral]
  end
  result
end

arr = [
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
]

arr = [
 [ 1, 2, 3, 10, 19],
 [ 4, 5, 6, 11, 20],
 [ 7, 8, 9, 12, 21],
 [ 13, 14, 15, 16, 22]
]

p spiral_order([[2,3]])
p [1,2,3,10,19,20,21,22,16,15,14,13,7,4,5,6,11,12,9,8]
