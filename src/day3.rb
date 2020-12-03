# frozen_string_literal: true

# Puzzle: https://adventofcode.com/2020/day/3

def read_forest(source_file)
  File.read(source_file).split("\n").map { |i| i.split('') }
end

def move(row, col, total_cols, strategy)
  row += strategy[:down]
  col += strategy[:right]
  col = col % total_cols

  [row, col]
end

def strategies
  [
    { right: 1, down: 1 },
    { right: 3, down: 1 },
    { right: 5, down: 1 },
    { right: 7, down: 1 },
    { right: 1, down: 2 }
  ]
end

def toboggan(source_file)
  trees = read_forest(source_file)

  strategies.map do |strategy|
    count = 0
    row = 0
    col = 0

    while row < trees.size
      count += 1 if trees[row][col] == '#'
      row, col = move(row, col, trees[0].size, strategy)
    end

    count
  end.reduce(&:*)
end

# for part 1 use only strategy[1] (second strategy)

example2 = toboggan('../input/day3-example.txt')
puts "Part 2 :: Expected: 336, got: #{example2}, match?: #{example2 == 336}"

part2 = toboggan('../input/day3.txt')
puts "Part 2 :: #{part2}" # 3621285278 ==> accepted
