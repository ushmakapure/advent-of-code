# frozen_string_literal: true

require 'pry'

# Puzzle: https://adventofcode.com/2020/day/3

def parse(source_file)
  File.read(source_file).split("\n\n").map { |i| i.split(' ') }
end

def conditions
  {
    byr: {
      lower: 1920,
      upper: 2002,
      regex: /^[[:digit:]]{4}$/
    },
    iyr: {
      regex: /^[[:digit:]]{4}$/,
      lower: 2010,
      upper: 2020
    },
    eyr: {
      regex: /^[[:digit:]]{4}$/,
      lower: 2020,
      upper: 2030
    },
    hgt: {
      regex: /^[[:digit:]]{2,3}(cm|in)$/,
      cm: {
        lower: 150,
        upper: 193
      },
      in: {
        lower: 59,
        upper: 76
      }
    },
    hcl: {
      regex: /^#([[:digit:]]|[a-f]){6}$/
    },
    ecl: {
      regex: /^(amb|blu|brn|gry|grn|hzl|oth)$/
    },
    pid: {
      regex: /^[[:digit:]]{9}$/
    }
  }
end

def validate_key(key, str)
  key = key.to_sym
  regex = conditions[key][:regex]
  return false unless str.match?(regex)

  return true if [:hcl, :ecl, :pid].include?(key)

  if key == :hgt
    if str.include?('cm')
      num = str.gsub('cm', '').to_i
      return conditions[key][:cm][:lower] <= num && num <= conditions[key][:cm][:upper]
    else
      num = str.gsub('in', '').to_i
      return conditions[key][:in][:lower] <= num && num <= conditions[key][:in][:upper]
    end
  else
    num = str.to_i
    return conditions[key][:lower] <= num && num <= conditions[key][:upper]
  end
end

def validate_passport(entry)
  hash = entry.to_h { |i| i.split(':') }
  conditions.each do |condition, _| 
    return false unless hash.key?(condition.to_s) 
    x = validate_key(condition, hash[condition.to_s])

    # puts "Condition: #{condition}, value: #{hash[condition.to_s]}, valid: #{x}"
    return false unless x
  end 

  true
end

def run(source_file)
  entries = parse(source_file)
  entries.count { |item| validate_passport(item) }
end

# puts run('../input/day4-example.txt')
puts run('../input/day4.txt')

# puts validate_key(:pid, "000000001")
# puts validate_key(:pid, "0123456789")



