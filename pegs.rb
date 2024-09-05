require 'rainbow'

class Pegs
  GAME_PEGS = {
    red: { color: Rainbow('o').red, key: 1 },
    blue: { color: Rainbow('o').blue, key: 2 },
    yellow: { color: Rainbow('o').yellow, key: 3 },
    green: { color: Rainbow('o').green, key: 4 },
    orange: { color: Rainbow('o').orange, key: 5 },
    purple: { color: Rainbow('o').purple, key: 6 }
  }.freeze

  def game_pegs
    GAME_PEGS
  end
end
