require_relative 'pegs'

class Cpu
  def initialize
    @pieces = Pegs.new
  end

  def choose_piece(key)
    @pieces.game_pieces.filter_map { |color, data| color if data[:key] == key }
  end

  def random_key
    rand(1..4)
  end

  def code_maker
    code = []
    4.times do
      code.push(choose_piece(random_key))
    end
    code.flatten
  end
end
