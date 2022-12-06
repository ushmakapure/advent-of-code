input = File.read('./input.txt').split("\n")
require 'pry'
# part 1
input.each do |line|
  i = 0
  j = 3
  l = line.split('')
  counter = 3
  found = false
  while j < l.length && found == false
    found = true if l[i..j].uniq.size == 4
    counter += 1
    i += 1
    j += 1
  end

  puts counter
end

# part 2
input.each do |line|
  i = 0
  j = 13
  l = line.split('')
  counter = 13
  found = false
  while j < l.length && found == false
    # binding.pry
    found = true if l[i..j].uniq.size == 14
    counter += 1
    i += 1
    j += 1
  end

  puts counter
end
