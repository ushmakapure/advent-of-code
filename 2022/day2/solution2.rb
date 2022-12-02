input = File.readlines('./input.txt')

## Here we make A = rock, B = paper and C = scissors for everyone
# X, Y, Z represent game results exclusively

def score(outcome, item)
  outcome_scores = {
    2 => 6, # win
    0 => 3, # draw
    1 => 0  # lose
  }
  item_played = { 'A' => 1, 'B' => 2, 'C' => 3 }

  outcome_scores[outcome] + item_played[item]
end

def play(opp, outcome)
  options = %w[A B C]
  raw_index = opp.ord - 'A'.ord - outcome # doing - because + didn't work as expected lol
  index = (raw_index + 3) % 3 # +3 to ensure indices are positive, %3 to circularize

  options[index]
end

score = 0

input.each do |game|
  opp, letter = game.split(' ')

  item_played = {
    'X' => 1, # lose
    'Y' => 0, # draw
    'Z' => 2 # win
  }
  outcome = item_played[letter]
  me = play(opp, outcome)
  score += score(outcome, me)
end

puts score
