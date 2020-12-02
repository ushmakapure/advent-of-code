# frozen_string_literal: true

# Puzzle: https://adventofcode.com/2020/day/1

def parse_input(source_file)
  File.read(source_file).split("\n").map(&:to_i)
end

##########################################
# Part 1 - find 2 entries that sum to 2020
##########################################

# returns first match, does not look for further matches
def find_two_entries_with_sum(target_num, entries)
  complements = {}

  entries.each_with_index do |entry, index|
    if complements.key?(entry)
      complement_index = complements[entry]
      return [entry, entries[complement_index]]
    else
      complements[target_num - entry] = index
    end
  end

  nil # no match found
end

example = find_two_entries_with_sum(2020, parse_input('../input/day1-example.txt')).reduce(:*)
puts "Expected: 514579, got: #{example}, match?: #{example == 514_579}"

matches = find_two_entries_with_sum(2020, parse_input('../input/day1.txt')).reduce(:*)
puts "Part 1 solution: #{matches}" # ==> 1010299, accepted

##########################################
# Part 2 - find 3 entries that sum to 2020
##########################################

# assumes there is a valid result, returns first result
def find_three_entries_with_sum(target_num, entries)
  entries.each_with_index do |entry, index|
    complements = find_two_entries_with_sum(target_num - entry, entries[index..-1])
    return [entry, complements].flatten if complements
  end

  nil
end

example = find_three_entries_with_sum(2020, parse_input('../input/day1-example.txt')).reduce(:*)
puts "Expected: 241861950, got: #{example}, match?: #{example == 241_861_950}"

matches = find_three_entries_with_sum(2020, parse_input('../input/day1.txt')).reduce(:*)
puts "Part 2 solution: #{matches}" # ==> 42140160, accepted
