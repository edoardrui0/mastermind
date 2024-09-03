require 'rainbow'
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
      puts give_clues
      @@turn += 1
    end
  end

  def give_clues
    clues_arr = []

    @@secret_code.each_with_index do |secret_color, index|
      clues_arr.push(Rainbow('~').red) if secret_color == @codebreaker.guess_arr[index]
      break if clues_arr.length >= 4
    end

    # small bug here
    # will show that a peg is in the correct index and on the board at the same time
    # in other words, will show both '~' and 'o' for a single peg if its in the correct index
    if clues_arr.length < 4
      matching_elements = @@secret_code & @codebreaker.guess_arr

      matching_elements.each do
        clues_arr.push(Rainbow('o').blue)
        break if clues_arr.length >= 4
      end
    end

    clues_arr.join(Rainbow(' | ').white)
  end
end

new = Mastermind.new
new.gameplay
