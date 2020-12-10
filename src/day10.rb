# frozen_string_literal: true

require 'pry'
require 'set'
# Puzzle: https://adventofcode.com/2020/day/10

def parse(source_file)
  File.read(source_file).split("\n").map(&:to_i)
end

def run(source_file)
  joltages = parse(source_file)
  rating = joltages.max + 3
  one_diff = 0 
  three_diff = 0 
  curr_joltage = 0
  # diff = 0 
  while curr_joltage < rating
    next_joltage = get_next(curr_joltage, joltages)

    diff = next_joltage - curr_joltage 
    if diff == 1 
      one_diff += 1 
    elsif diff == 3 
      three_diff += 1
    end
    curr_joltage = next_joltage
  end

  one_diff * three_diff
  # diff
end

def get_next(curr, joltages)
  i = curr + 1
  while i < curr + 3
    break if joltages.include?(i)
    i += 1
  end

  i
end

puts run('../input/day10.txt')
