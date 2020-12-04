# frozen_string_literal: true

# Puzzle: https://adventofcode.com/2020/day/3

def parse(source_file)
  File.read(source_file).split("\n\n").map { |i| i.split(' ') }
end

def hash_keys
  %w[ byr
      iyr
      eyr
      hgt
      hcl
      ecl
      pid]
  # cid
end

def validate_passport(entry)
  hash = entry.to_h { |i| i.split(':') }
  hash_keys.each { |k| return false unless hash.key?(k) }

  true
end

def run(source_file)
  entries = parse(source_file)
  entries.count { |item| validate_passport(item) }
end

puts run('../input/day4-example.txt')
puts run('../input/day4.txt')

