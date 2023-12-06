require 'set'

input = File.read('sample.txt').split("\n").map { |line| line.split('') }

start_pos = []
end_pos = []

input.each.with_index do |line, row|
  line.each.with_index do |char, col|
    if char == 'S'
      start_pos = [row, col]
      input[row][col] = 0
    elsif char == 'E'
      end_pos = [row, col]
      input[row][col] = 'z'.ord - 'a'.ord
    else
      input[row][col] = input[row][col].ord - 'a'.ord
    end
  end
end

input.each {|l| puts l.to_s}
puts start_pos.to_s
puts end_pos.to_s

todo = [start_pos]

num_rows = input.length
num_cols = input[0].length

## insert: push 
## remove: shift
seen = {}
path_length = 0 
while todo.length > 0 do
  curr_x, curr_y = todo.shiftqw
  puts "#{curr_x} : #{curr_y} ==>#{input[curr_x][curr_y]}"
  next if seen.has_key?([curr_x, curr_y])
  break if curr_x == end_pos[0] && curr_y == end_pos[1]

  for dX, dY in [[0, 1], [1, 0], [-1, 0], [0, -1]].shuffle do
    new_x = curr_x + dX
    new_y = curr_y + dY

    if 0 <= new_x && new_x < num_rows && 0 <= new_y && new_y < num_cols && (input[new_x][new_y] - input[curr_x][curr_y]) <= 1
        todo << [new_x, new_y]
    end
  end

  path_length += 1
  seen[[curr_x, curr_y]] = path_length
end

puts path_length
puts seen[end_pos]

# [0, 0, 1, 16, 15, 14, 13, 12]
# [0, 1, 2, 17, 24, 23, 23, 11]
# [0, 2, 2, 18, 25, 25, 23, 10]
# [0, 2, 2, 19, 20, 21, 22, 09]
# [0, 1, 3, 04, 05, 06, 07, 08]

# v..v<<<<
# >v.vv<<^
# .>vv>E^^
# ..v>>>^^
# ..>>>>>^
# [
#     [0 , 0, 2],
#     [1,  1, 2],
#     [1,  2, 3]
# ]

# discovered = [(0, 0), (0,1), (1,0)]
# q = [ , (1,1) ]
# step_count = 2

# valid_neighbours(0, 0): (0, 1), (1, 0)
# valid_neighbours(0, 1): (1, 1)