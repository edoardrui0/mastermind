require_relative 'pegs'

# This class is to acquire the guess from either the user or computer
class Codebreaker
  attr_accessor :name, :guess_arr

  def initialize(name)
    @pegs = Pegs.new
    @name = name
  end

  def guess
    @guess_arr = []
    until guess_arr.length == 4
      guesses = gets.chomp.split('').map(&:to_i)
      @pegs.game_pegs.filter_map do |_color, data|
        guesses.each_with_index { |_num, index| @guess_arr.push(data[:color]) if data[:key] == guesses[index] }
      end
      if guess_arr.length != 4
        guess_arr.clear
        puts "Code must only be 4 digits\n\n"
      end
    end
    @guess_arr
  end
end
