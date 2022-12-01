# frozen_string_literal: true

require 'pry'
require 'set'
require 'deep_enumerable'

# Puzzle: https://adventofcode.com/2020/day/11

def parse(source_file)
  File.read(source_file).split("\n").map { |i| i.split('') }
end


def run(source_file)
  og_seats = parse(source_file)
  seats = parse(source_file)
  # seats_dup = parse(source_file)
  changed = true
  count = 0

  while changed
    was_changed = [] 
    # binding.pry if count == 1
    seats_dup = seats.deep_dup
    (0...seats.length).each do |row| 
      (0...seats[1].length).each do |col|
        was_changed << apply_rules(row, col, seats, seats_dup, count == 1)
      end
    end
    # binding.pry if count == 1

    seats = seats_dup.deep_dup #.map { |i| i.map(&:dup) }
    changed = was_changed.include?(true)
    count+=1 if changed
  end

  seats.sum { |i| i.count { |c| c == '#' } }
  # count
end

def apply_rules(row, col, seats, seats_dup, should_break)
  adjacent = count_nearest(row, col, seats)
  changed = false

  # binding.pry if should_break && row == 1 && col == 2

  case seats[row][col] 
  when 'L'
    if adjacent == 0
      seats_dup[row][col] = '#'
      changed = true
    end
  when '#' 
    if adjacent >= 4
      changed = true
      seats_dup[row][col] = 'L'
    end
  else
    # noop
  end

  changed
end 

def count_adjacent(row, col, seats)
  count = 0 
  if 0 <= row+1 && row+1 < seats.length
    (col-1..col+1).each do |c| 
      # puts "[#{row+1}][#{c}]: #{seats[row+1][c]}"
      count += 1 if 0 <= c && c < seats[0].length && seats[row+1][c] == '#'
    end 
  end 
  if 0 <= row-1 && row-1 < seats.length
    (col-1..col+1).each do |c| 
      # puts "[#{row-1}][#{c}]: #{seats[row-1][c]}"
      count += 1 if 0 <= c && c < seats[0].length && seats[row-1][c] == '#'
    end 
  end

  count += 1 if 0 <= col-1 && col-1 < seats[0].length && seats[row][col-1] == '#'
  count += 1 if 0 <= col+1 && col+1 < seats[0].length && seats[row][col+1] == '#'

  count
end

# do BFS to find all next
def count_nearest(row, col, seats)
  q = [] 
  seen = [] 
  count = 0
  q << [row, col]
  seen << [row, col]

  while !q.empty? 
    # binding.pry
    node = q.shift
    r = node.first
    c = node.last

    # don't enqueue it
    if seats[r][c] != '.'
      binding.pry
      count += 1 if seats[r][c] == '#' 
    else
      # enquue all adjacent
      if 0 <= r+1 && r+1 < seats.length
        (c-1..c+1).each do |a| 
          if 0 <= a && a < seats[0].length && !seen.include?([r+1,a])
            q << [r+1, a] 
            seen << [r+1, a] 
          end
        end 
      end
      if 0 <= r-1 && r-1 < seats.length
        (c-1..c+1).each do |a| 
          if 0 <= a && a < seats[0].length && !seen.include?([r-1,a])
            q << [r-1, a]
            seen << [r-1, a]
          end
        end 
      end

      if 0 <= c-1 && c-1 < seats[0].length && !seen.include?([r,c-1])
        q << [r, c-1] 
        seen << [r, c-1] 
      end

      if 0 <= c+1 && c+1 < seats[0].length && !seen.include?([r,c+1])
        q << [r, c+1] 
        seen << [r, c+1] 
      end
    end
  end

  count
end

# puts run('../input/day11-example.txt')

ex = parse('../input/day11-example2.txt')
puts count_nearest(0, 0, ex)