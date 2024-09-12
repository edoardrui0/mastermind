require_relative 'pegs'
require_relative 'selection'

# This class is to acquire the guess from either the user or computer
class Codebreaker
  attr_accessor :name, :guess_arr, :selection

  def initialize(name)
    @pegs = Pegs.new
    @name = name
  end

  def user_guess
    @guess_arr = []
    until guess_arr.length == 4
      guesses = gets.chomp.split('').map(&:to_i)
      guesses.each do |guess_key|
        peg_data = @pegs.game_pegs.find { |_color, data| data[:key] == guess_key }
        @guess_arr.push(peg_data[1][:color]) if peg_data
      end

      if guess_arr.length != 4
        guess_arr.clear
        puts "Code must only be 4 digits\n\n"
      end
    end
    @guess_arr
  end

  def cpu_guess
    code = []
    until code.length == 4
      random_key = rand(1..6)
      @pegs.game_pegs.each_value do |data|
        code.push(data[:color]) if data[:key] == random_key
      end
    end
    code

    # needs to be able to detect what the code is from the user
  end

  def selection_made?(decision)
    # imo more needs to be added, this is just a basic switch, will continue to work on it
    if decision.made_selection == true && decision.codebreaker_class == true
      user_guess
    elsif decision.made_selection == true && decision.codemaker_class == true
      cpu_guess
    else
      'There was no selection'
    end
  end
end

# new = Codebreaker.new(1)
# puts new.cpu_guess
