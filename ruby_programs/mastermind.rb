# Turn to add pieces to the board
# Randlomly generatecode & save
# After 4 placed computer to give feedback

module Move

  def codebreaker_turn

    feedback = []

    print 'Please enter a 4 peg code (R | G | B | Y | O | P) :'
    code = gets.chomp.upcase.split("")
    puts "Guess = #{code}"
    puts "The code = #{@the_code}"
    # p @board

    code.each_with_index do |val, ind| 

      if @the_code[ind] == val
        feedback << "Y"
      elsif @the_code.include?(val)
        feedback << "O"
      else
        feedback << "-"
      end
    end

    p feedback

  end
end

module Code

  attr_accessor :the_code

  def create_code

    @the_code = []
    options = ["R", "G", "B", "Y", "O", "P"]

    i = 0
    while i < 4 do
      @the_code << (options[rand(0...6)])
      i += 1
    end
    p @the_code
  end

end

class Board

  include Move
  include Code

  attr_accessor :board

  def setup
    @board = {
      r1: {one: " ", two: " ", three: " ", four: " ",fb1: "-", fb2: "-", fb3: "-", fb4: "-"}
    }
  end

  def draw_board

    puts " ___ ___ ___ ___"
    puts "|   |   |   |   |"
    puts "| #{@board[:r1][:one]} | #{@board[:r1][:two]} | #{@board[:r1][:three]} | #{@board[:r1][:four]} | #{@board[:r1][:fb1]}#{@board[:r1][:fb2]}#{@board[:r1][:fb3]}#{@board[:r1][:fb4]}"
    puts "|___|___|___|___|"
    puts "                 "

  end
end

class Game < Board

  current_game = Board.new
  current_game.setup
  current_game.create_code
  current_game.draw_board
  current_game.codebreaker_turn

end

Game
