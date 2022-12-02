input = File.readlines('./sample.txt')

def outcome(opp, me)
  case ((me.ord - opp.ord) % 3).abs
  when 0
    'win'
  when 1
    'lose'
  when 2
    'draw'
  end
end

def score(outcome, item)
  outcome_scores = { 'win' => 6, 'draw' => 3, 'lose' => 0 }
  item_played = { 'X' => 1, 'Y' => 2, 'Z' => 3 }

  outcome_scores[outcome] + item_played[item]
end

score = 0
input.each do |game|
  opp, me = game.split(' ')
  result = outcome(opp, me)

  score += score(result, me)
end

puts score
