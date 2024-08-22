require_relative 'board'
require_relative 'pegs'
require_relative 'cpu'
require_relative 'player'

class Mastermind
  def initialize
    @board = Board.new
    @pegs = Pegs.new
    @player1 = Player.new('Player 1')
    @cpu = Cpu.new
  end

  def code
    @cpu.code_maker
  end

  def player_guess
    guess_arr = []
    4.times do
      guesses = gets.chomp.to_i
      @pegs.game_pieces.filter_map { |_color, data| guess_arr.push(data[:color]) if data[:key] == guesses }
    end
    guess_arr
  end
end

p Mastermind.new.player_guess
