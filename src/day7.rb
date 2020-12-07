# frozen_string_literal: true

require 'pry'
require 'set'

# Puzzle: https://adventofcode.com/2020/day/3

def parse(source_file)
  File.read(source_file).split("\n")
end

def read_rule(rule)
  container, bags_inside = rule.split(' contain ')
  bags = bags_inside.split(', ')
        .map { |i| i.gsub('.', '') }
        .map { |i| i.gsub('bags', 'bag') }
        .map { |i| i.gsub(/[[:digit:]]/, '') }
        .map { |i| i.strip }

  key = container.gsub('bags', 'bag')
  # binding.pry
  [key, bags]
end

def traverse(map, start)
  q = []
  map[start].each { |i| q.push(i)}
  visited = Set.new

  while !q.empty? 
    node = q.shift
    visited << node

    if map.key?(node)
      map[node].each { |i| q.push(i) if !visited.include?(i) }
    end
  end

  visited.size
end

def run(source_file)
  rules = parse(source_file)
  map = {}

  rules.each do |r|
    key, bags = read_rule(r)
    bags.each do |bag| 
      if map.key?(bag)
        vals = map[bag]
        vals << key
        map[bag] = vals
      else
        map[bag] = [key]
      end
    end
  end

  traverse(map, 'shiny gold bag')
end

puts run('../input/day7.txt')
