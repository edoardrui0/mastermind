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
    end

    clues_arr.join(Rainbow(' | ').white)

    # take what the player is inputting and compare it with @@secret_code.
    # for example, secret_code is [blue, red, yellow, yellow]
    # codebreaker's code is [red, red, green, blue]
    # in index 1, there are both reds, so let the player know that they got a color right in the correct index
    # in index 3 of codebreaker's code, there is blue, which is a color found in @@secret_code, just not in the right position
    #
    # when comparing the two arrays to see if there are colors presented in both, use `arr1 & arr2`, that will
    # return what those two arrays have in common
    #
    # install ruby gem that allows for colors
    #
    # if a comparison is found, display it onto the console to give the player a hint
    # use a red `o` if peg is in a correct position
    # use a blue `o` if peg is not in a correct position, but is a correct color
    #
    # push this into an array with length == 4
    # if no comparison is found, leave the array blank
  end
end

new = Mastermind.new
new.gameplay
# new.give_clues
