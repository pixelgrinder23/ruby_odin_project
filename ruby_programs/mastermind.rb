class Board

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

  def update_board(round, guess, feedback, maker, the_code)
    r = "r#{round}".to_sym
    fb = "fb#{round}".to_sym
    guess.each_with_index { |val, ind| @board[r][ind] = val }
    feedback.each_with_index { |val, ind| @feedback[fb][ind] = val }

    system("clear") || system("cls") # clears the terminal
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
    if maker == "H"
      puts " ___ ___ ___ ___"
      puts " "
      puts "| #{the_code[0]} | #{the_code[1]} | #{the_code[2]} | #{the_code[3]} |"
      puts " ___ ___ ___ ___"
      puts " "
    end

  end
  
end

class Game < Board

  attr_accessor :the_code, :maker

  print "(C)omputer or (Human) codemaker? "
  maker = gets.chomp.upcase

  current_game = Board.new

  if maker == "H" 
    print "Enter a 4 digit code (1-6) : "
    the_code = gets.chomp.split("").map! { |val| val.to_i }.first(4)
  else
    the_code = Array.new(4) { rand(1..6) }
  end

  escape = 0
  rounds = 1
  holding = [9,9,9,9]
  retry_nums = []

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
      
      current_game.update_board(rounds, guess, feedback, maker, the_code)
    else
      guess = [] 
      
      4.times do |num|
        if holding[num] != 9
          guess[num] = holding[num]
        elsif retry_nums.length > 0
          guess[num] = retry_nums.pop
        else 
          guess[num] = rand(1..6)
        end
      end
      current_game.update_board(rounds, guess, feedback, maker, the_code)
      puts "Your code = #{the_code}"
      print "Please give feedback using Y (correct), O (matching number), or - (incorrect) : "
      feedback = gets.chomp.upcase.split("")
      
      4.times do |num|
        if feedback[num] == "Y"
          holding[num] = guess[num]
        elsif feedback[num] == "O"
          retry_nums.push(guess[num])
        end
      end

      current_game.update_board(rounds, guess, feedback, maker, the_code)
    end

    if feedback == ["Y","Y","Y","Y"] 
      puts "CODE BROKEN!"
      escape = 1
    end
    rounds += 1

  end

end

Game 

# research & implement several strategies for solving & pick one at random each go, including my version
# https://puzzling.stackexchange.com/questions/546/clever-ways-to-solve-mastermind