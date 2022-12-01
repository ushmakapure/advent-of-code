# frozen_string_literal: true

# Puzzle: https://adventofcode.com/2020/day/2

def parse_input(source_file)
  File.read(source_file).split("\n").map { |i| i.split(':') }.map { |i| [i[0], i[1].strip] }
end

def parse_policy(policy)
  keys = policy.split(' ')
  letter = keys[-1]
  range = keys[0].split('-').map(&:to_i)

  {
    lower: range[0],
    upper: range[1],
    letter: letter
  }
end

# part 1
def valid_password_p1?(raw_policy, password)
  policy = parse_policy(raw_policy)
  count = password.count(policy[:letter])

  policy[:lower] <= count && count <= policy[:upper]
end

# part 2
def valid_password_p2?(raw_policy, password)
  policy = parse_policy(raw_policy)
  first = policy[:lower] - 1
  second = policy[:upper] - 1

  (password[first] == policy[:letter]) ^ (password[second] == policy[:letter])
end

def valid_password?(params, version)
  if version == 'v1'
    valid_password_p1?(params[0], params[1])
  else
    valid_password_p2?(params[0], params[1])
  end
end

def validate_passwords(source_file, version)
  parse_input(source_file).count { |item| valid_password?(item, version) }
end

example1 = validate_passwords('../input/day2-example.txt', 'v1')
puts "Part 1 :: Expected: 2, got: #{example1}, match?: #{example1 == 2}"

part1 = validate_passwords('../input/day2.txt', 'v1')
puts part1 # ==> 620, accepted

example2 = validate_passwords('../input/day2-example.txt', 'v2')
puts "Part 2 :: Expected: 1, got: #{example2}, match?: #{example2 == 1}"

part2 = validate_passwords('../input/day2.txt', 'v2')
puts part2 # ==> 727, accepted
