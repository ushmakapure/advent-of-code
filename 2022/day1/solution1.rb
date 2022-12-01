def calorie_count(input_file_name)
  input = File.readlines(input_file_name)

  global_max = 0
  elf_max = 0
  input.each do |line|
    if line == "\n"
      global_max = elf_max if elf_max > global_max
      elf_max = 0
    else
      calories = line.gsub("\n", '').to_i
      elf_max += calories
    end
  end

  global_max
end

puts "Sample: #{calorie_count('./sample.txt')}"
puts "Solution: #{calorie_count('./problem_input.txt')}"
