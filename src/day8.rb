# frozen_string_literal: true

require 'pry'
require 'set'

# Puzzle: https://adventofcode.com/2020/day/8

def parse(source_file)
  File.read(source_file).split("\n").map { |i| i.split(' ') }
end

def run(source_file)
  rules = parse(source_file)
  seen = Set.new # indexes we've already seen
  acc = 0 

  index = 0 
  while true
    rule = rules[index]
    break if seen.include?(index)

    seen << index

    if rule[0] == 'nop'
      index += 1
    elsif rule[0] == 'acc'
      index += 1 
      acc += rule[1].to_i
    elsif rule[0] == 'jmp'
      index += rule[1].to_i
    end
  end

  acc
end

puts run('../input/day8.txt')
