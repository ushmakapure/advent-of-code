input = File.readlines('./sample.txt')

def outcome(opp, me)
  return 'draw' if opp == me

  case opp
  when 'rock'
    me == 'paper' ? 'win' : 'lose'
  when 'paper'
    me == 'scissors' ? 'win' : 'lose'
  when 'scissors'
    me == 'rock' ? 'win' : 'lose'
  end
end

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

score = 0

opp_key_lookup = {
  'A' => 'rock',
  'B' => 'paper',
  'C' => 'scissors'
}

me_key_lookup = {
  'X' => 'rock',
  'Y' => 'paper',
  'Z' => 'scissors'
}

input.each do |game|
  opp, me = game.split(' ')
  result = outcome(opp_key_lookup[opp], me_key_lookup[me])

  score += score(result, me)
end

puts score
