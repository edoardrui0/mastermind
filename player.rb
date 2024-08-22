require_relative 'board'
require_relative 'pegs'

class Player
  attr_accessor :name, :turn

  def initialize(name, turn)
    @name = name
    @turn = turn
  end
end
