# frozen_string_literal: true

require 'pry'
require 'set'

# Puzzle: https://adventofcode.com/2020/day/8

def parse(source_file)
  File.read(source_file).split("\n").map { |i| i.to_i }
end

def find(i, j, n, nums)
  (i..j).each do |a|
    (i..j).each do |b| 
      next if a == b
      return true if nums[a] + nums[b] == nums[n] 
    end
  end

  false
end

def run(source_file)
  nums = parse(source_file)
  window_size = 25

  i = 0
  j = window_size

  while j < (nums.length - 1)
    n = j + 1 

    found_pair = find(i, j, n, nums)    
    if !found_pair
      # puts n
      return nums[n]
    end

    i+=1
    j+=1 
  end

  # puts j
end

puts run('../input/day9.txt')
