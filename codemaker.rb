require_relative 'pegs'

# renamed CPU to codemaker
class Codemaker
  def initialize
    @pegs = Pegs.new
  end

  def choose_pegs(key)
    # swapped out color to data[:color] since it would be easier to get the code that way
    @pegs.game_pegs.filter_map do |color, data|
      data[:color] if data[:key] == key
    end
  end

  def random_num
    rand(1..4) # up to the amount of colors avaliable
  end

  def code_maker
    code = []
    code.push(choose_pegs(random_num)) until code.length == 4
    code.flatten
  end
end
