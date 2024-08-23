require_relative 'board'

class Pegs
  GAME_PEGS = {
    red: { color: 'red', key: 1 },
    blue: { color: 'blue', key: 2 },
    yellow: { color: 'yellow', key: 3 },
    green: { color: 'green', key: 4 }
  }.freeze

  def game_pegs
    GAME_PEGS
  end
end
