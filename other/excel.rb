spreadsheet = [
  ['10','A1+A2','A1+C2'],
  ['1+3','A1','A1+B1']
]

# result_spreadsheet = [
#   ['10','14','34']
#   ['4','10','24']
# ]

def calculate_spreadsheet(spreadsheet)
  result_spreadsheet = spreadsheet.dup
  spreadsheet.length.times do |row|
    spreadsheet[0].length.times do |col|
      cell_value = calculate_cell(spreadsheet[row][col],spreadsheet)
      result_spreadsheet[row][col] = cell_value
    end
  end
  result_spreadsheet
end

def calculate_cell(cell_string, spreadsheet)
  operations = cell_string.split('+')
  accumulator = 0
  while operations.length > 0
    current_operation = operations.shift
    contains_letter = (/[A-Z]/ =~ current_operation)
    if contains_letter.nil?
      accumulator += current_operation.to_i
    else
      row = current_operation[1].to_i - 1
      col = current_operation[0].ord - 'A'.ord
      operations += spreadsheet[row][col].split('+')
    end
  end
  accumulator.to_s
end

p calculate_spreadsheet(spreadsheet)
