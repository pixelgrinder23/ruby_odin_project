
# module Drawing

#   def draw_board(rounds)

#     i = 0
#     puts " ___ ___ ___ ___"
#     while i < rounds do

#       x = "r#{i + 1}".to_sym
#       y = "fb#{i + 1}".to_sym
#       puts "|   |   |   |   |"
#       puts "| #{@board[x][0]} | #{@board[x][1]} | #{@board[x][2]} | #{@board[x][3]} | #{@feedback[y].join}"
#       puts "|___|___|___|___|"
#       i += 1
#     end
#     puts " "
#   end

# end

class Board

  include Drawing

  attr_accessor :board, :feedback

  def initialize

    @board = {
      r1: [" ", " ", " ", " "],
      r2: [" ", " ", " ", " "],
      r3: [" ", " ", " ", " "],
      r4: [" ", " ", " ", " "],
      r5: [" ", " ", " ", " "],
      r6: [" ", " ", " ", " "]
    }

    @feedback = {
      fb1: [" ", " ", " ", " "],
      fb2: [" ", " ", " ", " "],
      fb3: [" ", " ", " ", " "],
      fb4: [" ", " ", " ", " "],
      fb5: [" ", " ", " ", " "],
      fb6: [" ", " ", " ", " "]
    }
  end

  def update_board(round, guess, feedback)
    r = "r#{round}".to_sym
    fb = "fb#{round}".to_sym
    guess.each_with_index { |val, ind| @board[r][ind] = val }
    feedback.each_with_index { |val, ind| @feedback[fb][ind] = val }

    i = 0
    puts " ___ ___ ___ ___"
    while i < round do

      x = "r#{i + 1}".to_sym
      y = "fb#{i + 1}".to_sym
      puts "|   |   |   |   |"
      puts "| #{@board[x][0]} | #{@board[x][1]} | #{@board[x][2]} | #{@board[x][3]} | #{@feedback[y].join}"
      puts "|___|___|___|___|"
      i += 1
    end
    puts " "
  end
  
end

class Game < Board

  print "(C)omputer or (Human) code maker? "
  maker = gets.chomp.upcase

  current_game = Board.new

  if maker == "H" 
    print "Enter a 4 digit code (1-6) : "
    the_code = gets.chomp.slice(0,4)
  else
    the_code = Array.new(4) { rand(1..6) }
  end

  escape = 0
  rounds = 1

  until escape == 1 || rounds == 7 do

    feedback = []

    if maker == "C"
      print 'Please enter a 4 peg code (1-6) : '
      guess = gets.chomp.split("").map! { |val| val.to_i }.first(4)
      
      puts "The code = #{the_code}"

      guess.each_with_index do |val, ind|
        if the_code[ind] == val
          feedback << "Y"
        else
          feedback << val
        end
      end

      the_code.each_with_index do |val, ind|
        if feedback[ind] != "Y" && feedback.include?(val)
          feedback[feedback.find_index(val)] = "O"
        end
      end

      feedback.map! do |val| 
        if val == "O" || val == "Y"
          val = val
        else 
          val = "-"
        end
      end
      
      current_game.update_board(rounds, guess, feedback)
    else
      guess = Array.new(4) { rand(1..6) }
      
      current_game.update_board(rounds, guess, feedback)
      puts "The guess = #{guess}"
      print "Please give feedback using Y (correct), O (matching number), or - (incorrect) : "
      feedback = gets.chomp.upcase.split("")
      
      current_game.update_board(rounds, guess, feedback)
    end

    if feedback == ["Y","Y","Y","Y"] 
      puts "WINNER"
      escape = 1
    end
    rounds += 1

  end

end

Game 

# build my own approach for computer guessing
# research & implement several strategies for solving & pick one at random each go, including my version
# https://puzzling.stackexchange.com/questions/546/clever-ways-to-solve-mastermind