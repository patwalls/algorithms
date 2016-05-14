matrix = [
	[0,1,0,0,0,0,0],
	[0,1,1,1,1,0,0],
	[0,0,0,1,0,0,0],
	[1,1,0,1,0,1,0],
	[0,0,0,1,0,1,0],
	[0,1,1,1,0,1,0],
	[0,0,0,0,0,1,0]
]


def matrix_reachable(matrix)
	shortest_path = 0
	visited_hash = 
	queue = [ [ [0,0],[[0,0]] ] ]
	while queue.length > 0
		tile = queue.shift
		coord = tile[0]
		['down','right','up','left'].each do |direction|
			move = move(matrix, direction, coord[0], coord[1])
			if move[0] != nil && move[0] != 1
				next_coord = move[1]
				path = current_path + [next_coord]
				queue_tuple = [[next_coord], path]
				queue << queue_tuple
			end
		end
	end
	tile
end

def move(matrix, direction, curr_row, curr_col)
	if direction == 'up'
		return nil if curr_row == 0
		[matrix[curr_row - 1][curr_col],[curr_row - 1, curr_col]]
	elsif direction == 'down'
		return nil if curr_row == matrix.length - 1
		result = [matrix[curr_row + 1][curr_col],[curr_row + 1, curr_col]]
		result
	elsif direction == 'left'
		return nil if curr_col == 0 
		[matrix[curr_row][curr_col - 1],[curr_row, curr_col - 1]]
	elsif direction == 'right'
		return nil if curr_col == matrix[0].length - 1
		[matrix[curr_row][curr_col + 1],[curr_row, curr_col + 1]]
	end
end

matrix_reachable(matrix)