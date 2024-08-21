require_relative 'board'

class Peg
  GAME_PIECES = {
    red: { color: 'red', key: 1 },
    blue: { color: 'blue', key: 2 },
    yellow: { color: 'yellow', key: 3 },
    green: { color: 'green', key: 4 }
  }

  def game_pieces
    GAME_PIECES
  end
end

new = Peg.new
puts new.game_pieces[:red]
