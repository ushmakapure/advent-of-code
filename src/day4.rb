# frozen_string_literal: true

# Puzzle: https://adventofcode.com/2020/day/3

def parse(source_file)
  File.read(source_file).split("\n\n").map { |i| i.split(' ') }
end

def conditions
  {
    byr: /^(19[2-9][0-9]|200[0-2])$/,
    iyr: /^(201[0-9]|2020)$/,
    eyr: /^(202[0-9]|2030)$/,
    hgt: /^(59in|6[0-9]in|7[0-6]in|1[5-8][0-9]cm|19[0-3]cm)$/,
    hcl: /^#([[:digit:]]|[a-f]){6}$/,
    ecl: /^(amb|blu|brn|gry|grn|hzl|oth)$/,
    pid: /^[[:digit:]]{9}$/
  }
end

def validate_passport(entry)
  hash = entry.to_h { |i| i.split(':') }
  conditions.each do |condition, regex|
    return false unless hash.key?(condition.to_s)
    return false unless hash[condition.to_s].match?(regex)
  end

  true
end

def run(source_file)
  entries = parse(source_file)
  entries.count { |item| validate_passport(item) }
end

# puts run('../input/day4-example.txt')
puts run('../input/day4.txt')
