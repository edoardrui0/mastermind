class Board
  def initialize
    @board_pos = Array.new(12) { [1, 2, 3, 4] } # `pos` stands for position
  end

  def display_board
    @board_pos.map { |row| row.join(' | ') }
  end
end
