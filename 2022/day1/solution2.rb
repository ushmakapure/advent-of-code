puts "---------- Method 1 ---------"

def calorie_count(input_file_name)
  input = File.readlines(input_file_name)
  calories_per_elf = []
  elf_index = 0

  input.each do |line|
    if line == "\n"
      elf_index += 1
    else
      calories_til_now = line.gsub("\n", '').to_i + (calories_per_elf[elf_index] || 0)
      calories_per_elf[elf_index] = calories_til_now
    end
  end

  calories_per_elf.sort.last(3).sum
end

puts "Sample: #{calorie_count('./sample.txt')}"
puts "Solution: #{calorie_count('./problem_input.txt')}"

puts "---------- Method 2 ---------"

require 'set'
def calorie_count_sorted_set(input_file_name)
  input = File.readlines(input_file_name)
  calories_per_elf = SortedSet.new
  calories_til_now = 0 

  input.each do |line|
    if line == "\n"
      calories_per_elf << calories_til_now
      calories_til_now = 0 
    else
      calories_til_now += line.gsub("\n", '').to_i 
    end
  end

  # special case for last entry
  calories_per_elf << calories_til_now

  calories_per_elf.to_a.last(3).sum
end

puts "Sample: #{calorie_count_sorted_set('./sample.txt')}"
puts "Solution: #{calorie_count_sorted_set('./problem_input.txt')}"