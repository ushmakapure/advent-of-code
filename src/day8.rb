# frozen_string_literal: true

require 'pry'
require 'set'

# Puzzle: https://adventofcode.com/2020/day/8

def parse(source_file)
  File.read(source_file).split("\n").map { |i| i.split(' ') }
end

def do_thing(rule_copy)
  seen = Set.new # ies we've already seen
  acc = 0 
  i = 0
  terminated = true
  while i < rule_copy.length # follow rules and see if it terminates?
    rule = rule_copy[i]
    # puts "seen: #{seen}, index: #{i}, rule: #{rule}"
    if seen.include?(i)
      terminated = false
      break
    end

    seen << i

    if rule[0] == 'nop'
      i += 1
    elsif rule[0] == 'acc'
      i += 1 
      acc += rule[1].to_i
    elsif rule[0] == 'jmp'
      if rule[1].to_i.zero? 
        terminated = false
        break
      else 
        i += rule[1].to_i
      end
    end
  end

  [terminated, acc]
end


def run(source_file)
  rules = parse(source_file)

  j = 0
  while j < rules.length
    candidate = rules[j]
    if candidate[0] == 'acc'
      j += 1 
    else 
      rule_copy = parse(source_file) 
      rule = rules[j]
      if rule.nil?
        puts j
        puts rules.length
      end

      rule[0] = rule[0] == 'nop' ? 'jmp' : 'nop' 
      rule_copy[j] = rule

      terminated, acc = do_thing(rule_copy)
      if terminated # found a match
        return acc
      else 
        j += 1
      end
    end
  end

  acc
end

puts run('../input/day8.txt')
