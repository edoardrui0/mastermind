class Selection
  attr_accessor :codebreaker_class, :codemaker_class, :made_selection

  def initialize
    @codebreaker_class = nil
    @codemaker_class = nil
    @made_selection = nil
  end

  CLASSES = {
    codebreaker: { class: 'Codebreaker', key: 1 },
    codemaker: { class: 'Codemaker', key: 2 }
  }

  def selected_class?
    puts 'Please choose between these two classes'
    CLASSES.filter_map { |_class, value| puts "For #{value[:class]} press #{value[:key]}" }

    until made_selection
      selection = gets.chomp.to_i
      if selection == CLASSES[:codebreaker][:key]
        puts "You have selected #{CLASSES[:codebreaker][:class]}"
        @codebreaker_class = true
        @codemaker_class = false
        @made_selection = true
      elsif selection == CLASSES[:codemaker][:key]
        puts "You have selected #{CLASSES[:codemaker][:class]}"
        @codemaker_class = true
        @codebreaker_class = false
        @made_selection = true
      else
        puts 'Incorrect input. Only 1 or 2 are allowed'
        @made_selection = false
      end
    end
  end
end

# new = Selection.new
# new.selected_class?
