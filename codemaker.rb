require_relative 'pegs'

# renamed CPU to codemaker
class Codemaker
  def initialize
    @pegs = Pegs.new
  end

  def choose_pegs(key)
    @pegs.game_pegs.filter_map { |color, data| color if data[:key] == key }
  end

  def random_num
    rand(1..4)
  end

  def code_maker
    code = []
    code.push(choose_pegs(random_num)) until code.length == 4
    code.flatten
  end
end
