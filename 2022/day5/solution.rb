drawing, moves = File.read('input.txt').split("\n\n")
def initialize_board(drawing)
  blueprints = drawing.split("\n")
  key = blueprints.pop 

  board = {}
  key.each_char.with_index do |number, i| 
    if number.match?(/[1-9]/)
      board[number.to_i] = blueprints.filter_map { |b| b[i] if b[i] != " " }.reverse
    end
  end

  board
end 


def run_moves1(moves_raw, board)
  moves = moves_raw.split("\n")
  moves.each do |move| 
    number_raw, location_raw = move.split('from')
    number = number_raw.gsub(/move/, '').strip.to_i
    from, to = location_raw.split('to').map(&:strip).map(&:to_i)

    # binding.pry

    number.times do 
      crate = board[from].pop 
      board[to].push(crate)
    end
  end 

  board.values.map(&:pop).join
end

def run_moves2(moves_raw, board)
  moves = moves_raw.split("\n")
  moves.each do |move| 
    number_raw, location_raw = move.split('from')
    number = number_raw.gsub(/move/, '').strip.to_i
    from, to = location_raw.split('to').map(&:strip).map(&:to_i)

    slice = [] 
    number.times do
      slice << board[from].pop 
    end

    board[to] += slice.reverse
  end 

  board.values.map(&:pop).join
end

board = initialize_board(drawing)
# puts run_moves1(moves, board)
puts run_moves2(moves, board)