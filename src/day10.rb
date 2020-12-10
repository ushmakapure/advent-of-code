# frozen_string_literal: true

require 'pry'
# Puzzle: https://adventofcode.com/2020/day/10

def parse(source_file)
  File.read(source_file).split("\n").map(&:to_i)
end

def build(key, joltages, map)
  return map[key] if map.key?(key)

  sum = 0
  ((key-3)..(key-1)).each do |i|
    if joltages.include?(i)
      map[i] = build(i, joltages, map)
      sum += map[i]
    end
  end

  map[key] = sum
end

def run(source_file)
  joltages = parse(source_file)
  rating = joltages.max + 3
  joltages << 0 
  joltages << rating
  map = {} 
  map[0] = 1 
  
  build(rating, joltages, map)
end


puts run('../input/day10.txt')