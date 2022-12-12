# require 'pry'
# require 'set'

# steps = File.read('input.txt').split("\n").map {|l| l.split(' ')}

# visited = Set.new 
# head = [0,0]
# tail = [0,0]


# def move_head(direction, head)
#   r, c = head
#   case direction 
#   when 'R'
#     [r, c+1]
#   when 'L'
#     [r, c-1]
#   when 'U'
#     [r+1, c]
#   when 'D'
#     [r-1, c]
#   end 
# end 

# def touching?(head, tail)
#   tr, tc = tail 
#   hr, hc = head 

#   ((tr-1)..(tr+1)).include?(hr) && ((tc-1)..(tc+1)).include?(hc)
# end 

# def same_row?(head, tail)
#   head[0] == tail[0]
# end

# def same_col?(head, tail)
#   head[1] == tail[1]
# end

# # def move_tail(direction, head, tail)
# #   if same_row?(head, tail)
# #     tail[1] += 1 if head[1] > tail[1]
# #     tail[1] -= 1 if head[1] < tail[1]
# #   elsif same_col?(head, tail)
# #     tail[0] += 1 if head[0] > tail[0]
# #     tail[0] -= 1 if head[0] < tail[0]
# #   else 
# #     # diagonal 
# #     if head[0] > tail[0] && head[1] > tail[1]
# #       tail[0] += 1 
# #       tail[1] += 1
# #     elsif head[0] < tail[0] && head[1] > tail[1]
# #       # binding.pry
# #       tail[0] -= 1 
# #       tail[1] += 1
# #     elsif head[0] < tail[0] && head[1] < tail[1]
# #       # binding.pry
# #       tail[0] -= 1 
# #       tail[1] -= 1

# #     elsif head[0] > tail[0] && head[1] < tail[1]
# #       # binding.pry
# #       tail[0] += 1 
# #       tail[1] -= 1
# #     end 
# #   end 

# #   tail
# # end


# def sign(x)
#   return 0 if x.zero?
#   x / x.abs
# end

# def move_tail(h,t)
#   dx = h[0] - t[0]
#   dy = h[1] - t[1]

#   if dx.abs >= 2 || dy.abs >= 2
#     t[0] += sign(dx)
#     t[1] += sign(dy)
#   end

#   t
# end


# # puts touching?([0,0], [0,2])
# # puts touching?([0,0], [0,1])
# # puts touching?([0,0], [0,0])
# # puts touching?([0,0], [1,0])
# # puts touching?([0,0], [2,0])


# steps.each do |step|
#   puts step.to_s
#   direction, count = step 

#   count.to_i.times do 
#     visited << tail.dup
#     head = move_head(direction, head)
#     tail = move_tail(head, tail) unless touching?(head, tail)

#     puts "#{head}, #{tail}"
#   end 
# end 

# puts visited.size

require 'set'

# $stdout = File.open('aoc.out', 'w')

tail_visited = Set.new

input = File.open('input.txt') do |f|
  f.readlines.map do |line|
    dir, count = line.split
    count = count.to_i
    [dir, count]
  end
end

$head = [0, 0]
$tail = [0, 0]
tail_visited << $tail.dup

def sign(x)
  return 0 if x.zero?
  x / x.abs
end

def update_tail!
  dx = $head[0] - $tail[0]
  dy = $head[1] - $tail[1]

  if dx.abs >= 2 || dy.abs >= 2
    $tail[0] += sign(dx)
    $tail[1] += sign(dy)
  end
end

input.each do |dir, count|
  count.times do
    case dir
    when 'L'
      $head[0] -= 1
    when 'R'
      $head[0] += 1
    when 'U'
      $head[1] += 1
    when 'D'
      $head[1] -= 1
    else
      fail
    end

    update_tail!

    tail_visited << $tail.dup
  end
end

p tail_visited.size