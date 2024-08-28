require_relative 'pegs'

# renamed player to codebreaker
class Codebreaker
  attr_accessor :name, :guess_arr

  def initialize(name)
    @pegs = Pegs.new
    @name = name
  end

  def guess
    @guess_arr = []
    until guess_arr.length == 4
      guesses = gets.chomp.to_i
      @pegs.game_pegs.filter_map { |_color, data| @guess_arr.push(data[:color]) if data[:key] == guesses }
    end
    @guess_arr
  end
end

# p Codebreaker.new(1).guess
