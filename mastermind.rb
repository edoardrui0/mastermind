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
    @secret_code = @codemaker.code_maker

    until @secret_code == @codebreaker.guess_arr || @@turn == 12
      @board.update_board(@@turn, @codebreaker.guess)
      puts @board.display_board
      puts give_clues
      @@turn += 1
    end
  end

  def give_clues
    @clues_arr = []
    @secret_code_dup = @secret_code.dup
    @guess_dup = @codebreaker.guess_arr.dup

    exact_match
    wrong_position

    @clues_arr.compact.join(Rainbow(' | ').white)
  end

  def exact_match
    @guess_dup.each_with_index do |guess_color, index|
      next unless guess_color == @secret_code_dup[index]

      @clues_arr.push(Rainbow('~').red)
      @secret_code_dup[index] = nil # if a match was found, will set the appropiate indices to nil
      @guess_dup[index] = nil
    end
  end

  def wrong_position
    @guess_dup.each do |guess_color|
      next if guess_color.nil?

      next unless @secret_code_dup.include?(guess_color)

      @clues_arr.push(Rainbow('o').blue)
      @secret_code_dup[@secret_code_dup.index(guess_color)] = nil # Sets the first occurrence of guess_color in @secret
                                                                  # _code_dup to nil to avoid re-matching. # rubocop:disable Layout/CommentIndentation
    end
  end
end

new = Mastermind.new
new.gameplay
