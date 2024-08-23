require_relative 'board'
require_relative 'pegs'
require_relative 'codemaker'
require_relative 'codebreaker'

class Mastermind
  attr_accessor :codebreaker, :codemaker

  @@turn = 0

  def initialize
    @board = Board.new
    @codebreaker = Codebreaker.new('Player 1')
    @codemaker = Codemaker.new
  end

  def gameplay
    @@secret_code = @codemaker.code_maker
    p @@secret_code

    until @@secret_code == @codebreaker.guess_arr || @@turn == 12
      @board.update_board(@@turn, @codebreaker.guess)
      puts @board.display_board
      @@turn += 1
    end
  end
end

new = Mastermind.new
new.gameplay
