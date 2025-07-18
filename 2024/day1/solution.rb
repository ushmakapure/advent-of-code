#######################
# Part 1
#######################

input = File.read('input1.txt')
  .split("\n")
  .map { |arr| arr.split(' ')}

left = input.map { |items| items[0].to_i }.sort
right = input.map { |items| items[1].to_i }.sort

diffs = []
left.each_with_index do |item, index|
    diffs[index] = (left[index] - right[index]).abs
end 

# puts "#{input}" 

# puts "#{diffs}" 

puts "#{diffs.sum}" 


#######################
# Part 2
#######################

# tallies = {}
# right.each do |i|
#   if tallies.include?(i)
#     tallies[i] += 1
#   else 
#     tallies[i] = 1 
#   end 
# end

tallies = right.tally
similarity_score = 0

left.each do |item|
  appearances = tallies[item]
  next if appearances.nil?

  similarity_score += appearances * item 
end

puts similarity_score
