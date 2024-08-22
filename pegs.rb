require_relative 'board'

class Pegs
  GAME_PIECES = {
    red: { color: 'red', key: 1 },
    blue: { color: 'blue', key: 2 },
    yellow: { color: 'yellow', key: 3 },
    green: { color: 'green', key: 4 }
  }.freeze

  def game_pieces
    GAME_PIECES
  end
end

# new = Peg.new
# new.game_pieces[:red]
