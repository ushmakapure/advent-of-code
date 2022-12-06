input = File.read('./input.txt').split("\n")

def parse_range(elf)
  s, e = elf.split('-').map(&:to_i)
  { s: s, e: e }
end

def inrange?(item, range)
  range[:s] <= item && item <= range[:e]
end

complete_overlaps = 0
partial_overlaps = 0

input.each do |i|
  first, second = i.split(',').map { |e| parse_range(e) }
  inrange1 = inrange?(second[:s], first) && inrange?(second[:e], first)
  inrange2 = inrange?(first[:s], second) && inrange?(first[:e], second)

  complete_overlaps += 1 if inrange1 || inrange2

  partial_overlaps += 1 if inrange?(second[:s], first) || inrange?(second[:e], first) ||
                           inrange?(first[:s], second) || inrange?(first[:e], second)
end

puts complete_overlaps
puts partial_overlaps
