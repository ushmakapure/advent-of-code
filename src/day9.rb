# frozen_string_literal: true

require 'pry'

# Puzzle: https://adventofcode.com/2020/day/9

def parse(source_file)
  File.read(source_file).split("\n").map(&:to_i)
end

def find(i, j, sum, nums)
  (i..j).each do |a|
    ((a + 1)..j).each do |b|
      return nums[a..b].min + nums[a..b].max if nums[a..b].sum == sum
    end
  end
end

def run(source_file, sum, _window_size)
  nums = parse(source_file)
  find(0, nums.length - 1, sum, nums)
end

sum = 26_134_589
window_size = 25
# example_sum = 127
# example_window_size = 5
puts run('../input/day9.txt', sum, window_size)
