require 'pry'

trees = File.read('input.txt').split("\n").map { |line| line.split('').map(&:to_i) }

puts trees.to_s

rows = trees.length
cols = trees[0].length
periphery = (rows * 2) + (cols * 2) - 4

internal = 0

def visible?(trees, r, c)
  rows = trees.length
  cols = trees[0].length
  selected_tree_height = trees[r][c]
  # puts selected_tree_height
  not_visible = 0
  # puts "---"

  # binding.pry
  # check above
  (0...r).each do |row|
    # puts trees[row][c]
    # puts "---"
    if trees[row][c] >= selected_tree_height
      not_visible += 1
      break
    end
  end
  # binding.pry
  # puts "---"

  # check below
  (r + 1...rows).each do |row|
    # puts trees[row][c]
    # puts "---"

    if trees[row][c] >= selected_tree_height
      not_visible += 1
      break
    end
  end
  # binding.pry
  # puts "---"

  # check cols
  (0...c).each do |col|
    # puts trees[r][col]

    if trees[r][col] >= selected_tree_height
      not_visible += 1
      break
    end
  end
  # binding.pry
  # puts "---"

  # check cols
  (c + 1...cols).each do |col|
    # puts trees[r][col]

    if trees[r][col] >= selected_tree_height
      not_visible += 1
      break
    end
  end
  # binding.pry

  not_visible < 4
end

(1..rows - 2).each do |row|
  (1..cols - 2).each do |col|
    internal += 1 if visible?(trees, row, col)
  end
end

puts periphery
puts internal

puts periphery + internal

# puts visible?(trees, 1, 1) == true
# puts visible?(trees, 1, 2) == true
# puts visible?(trees, 1, 3) == false
# puts visible?(trees, 2, 1) == true
# puts visible?(trees, 2, 2) == false
# puts visible?(trees, 2, 3) == true
# puts visible?(trees, 3, 1) == false
# puts visible?(trees, 3, 2) == true
# puts visible?(trees, 3, 3) == false
