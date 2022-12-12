require 'pry'

trees = File.read('input.txt').split("\n").map { |line| line.split('').map(&:to_i) }

# puts trees.to_s

rows = trees.length
cols = trees[0].length

def num_trees_visible(trees, r, c)
  rows = trees.length
  cols = trees[0].length
  selected_tree_height = trees[r][c]
  score = [0, 0, 0, 0]
  index = 0

  # top
  ((r - 1).downto(0)).each do |row|
    score[index] += 1

    break if trees[row][c] >= selected_tree_height
  end

  index += 1

  # bottom
  (r + 1...rows).each do |row|
    score[index] += 1
    break if trees[row][c] >= selected_tree_height
  end

  index += 1

  # left
  ((c - 1).downto(0)).each do |col|
    score[index] += 1
    break if trees[r][col] >= selected_tree_height
  end

  index += 1
  # right 
  (c + 1...cols).each do |col|
    score[index] += 1
    break if trees[r][col] >= selected_tree_height
  end

  # puts score.to_s
  score.reduce(&:*)
end

viz = []
(1..rows - 2).each do |row|
  (1..cols - 2).each do |col|
    viz << num_trees_visible(trees, row, col)
  end
end

puts viz.max
# puts num_trees_visible(trees, 1, 2)