require 'pry'

input = File.read('input.txt').split("\n")

filesystem = { '/' => {} }

curr_path = []
cwd = nil

input.each.with_index do |line, _index|
  if line.match?(/\$ cd/) # move dirs
    if line.match?(/\$ cd \.\./) # move up
      cwd = curr_path.pop

    else
      # we shouldn't encounter a case where cwd doesn't already exist because we made it in /dir/
      curr_path << cwd unless cwd.nil?
      cwd = line.gsub(/\$ cd/, '').strip
    end

  elsif line.match?(/\$ ls/) # list items in previous directory
    # skip?

  elsif line.match?(/dir/) # directory - add to filesystem
    dirname = line.gsub(/dir/, '').strip
    curr_dir = filesystem
    curr_path.each { |f| curr_dir = curr_dir[f] } # go deeper if we are lower down in the structure
    curr_dir[cwd][dirname] = {}

  else # this is a file, add filesize and name to system
    filesize, filename = line.split(' ')
    curr_dir = filesystem
    curr_path.each { |f| curr_dir = curr_dir[f] }

    curr_dir[cwd][filename] = filesize.to_i
  end
end

# puts "#{filesystem}"

# traverse dir to get filesizes
def dirsize(dir, size_til_now, dir_sizes)
  size = 0
  dir.each do |_key, value|
    size += if value.is_a? Hash
              dirsize(value, size_til_now, dir_sizes)
            else
              value
            end
  end

  dir_sizes << size

  size + size_til_now
end

dir_sizes = []
total_size = dirsize(filesystem.dig('/'), 0, dir_sizes)

puts total_size
# part 1
dir_sizes.reject { |a| a > 100_000 }.sum

# part 2
unused_space = 70_000_000 - total_size
puts unused_space

required_space = 30_000_000 - unused_space
puts required_space

puts dir_sizes.filter { |d| d > required_space }.sort.first.to_s
