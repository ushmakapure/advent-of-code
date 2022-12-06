input = File.read('./sample.txt').split("\n")

require 'pry'

# part 1
sum = input.sum do |i|
  first = i[0..(i.length / 2 - 1)]
  second = i[(i.length / 2)..(i.length - 1)]

  intersection = first.split('').intersection(second.split('')).first

  intersection.match?(/[A-Z]/) ? (intersection.ord - 'A'.ord + 27) : (intersection.ord - 'a'.ord + 1)
end

puts sum

# part 2

priorities_sum = 0
input.each_slice(3) do |slice|
  char_arrays = slice.map { |i| i.split('') }
  intersection = (char_arrays[0].intersection(char_arrays[1])).intersection(char_arrays[2]).first

  priorities_sum += intersection.match?(/[A-Z]/) ? (intersection.ord - 'A'.ord + 27) : (intersection.ord - 'a'.ord + 1)
end

puts priorities_sum
