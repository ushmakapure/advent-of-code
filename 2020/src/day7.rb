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
                    .map { |i| [i.match(/[[:digit:]]/).to_s.to_i, i.gsub(/[[:digit:]]/, '').strip] }

  key = container.gsub('bags', 'bag')
  # binding.pry
  [key, bags]
end

def traverse(map, start)
  q = []
  map[start].each { |i| q.push(i) }
  visited = Set.new

  until q.empty?
    node = q.shift
    visited << node

    if map.key?(node)
      map[node].each { |i| q.push(i) unless visited.include?(i) }
    end
  end

  visited
end

def run(source_file)
  rules = parse(source_file)
  map = {}

  rules.each do |r|
    key, bags = read_rule(r)
    map[key] = bags
  end
  count_bags_inside([1, 'shiny gold bag'], map) - 1
end

def count_bags_inside(node, graph)
  contents = graph[node.last]
  return 0 unless contents

  node.first * (contents.sum { |color| count_bags_inside(color, graph) } + 1)
end

puts run('../input/day7.txt')
