input = File.readlines('./sample.txt')

def score(outcome, item)
  outcome_scores = {
    'win' => 6,
    'draw' => 3,
    'lose' => 0
  }
  item_played = {
    'X' => 1,
    'Y' => 2,
    'Z' => 3
  }

  outcome_scores[outcome] + item_played[item]
end

def play(opp, outcome)
  draw = {   'A' => 'X',    'B' => 'Y',    'C' => 'Z'  }
  win = {    'A' => 'Y',    'B' => 'Z',    'C' => 'X'  }
  lose = {   'A' => 'Z',    'B' => 'X',    'C' => 'Y'  }

  case outcome
  when 'draw'
    draw[opp]
  when 'win'
    win[opp]
  when 'lose'
    lose[opp]
  end
end

score = 0

input.each do |game|
  opp, letter = game.split(' ')

  item_played = {
    'X' => 'lose',
    'Y' => 'draw',
    'Z' => 'win'
  }
  outcome = item_played[letter]
  me = play(opp, outcome)
  score += score(outcome, me)
end

puts score
