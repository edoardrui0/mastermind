require_relative 'codebreaker'

class Board
  attr_accessor :board_pos

  def initialize
    @board_pos = Array.new(12) { [1, 2, 3, 4] } # `pos` stands for position
  end

  def display_board
    @board_pos.map { |row| row.join(' | ') }
  end

  def update_board(turn, guess)
    @board_pos.each_with_index do |_row, index|
      @board_pos[index] = guess if turn == index
    end
  end
end
