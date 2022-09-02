# Tic Tac Toe

# Making moves
module Move

  @whos_move = ""
  attr_reader :move_taken

  @move_taken = [nil, nil]
  
  def player_turn
    @whos_move == "X" ? @whos_move = "O" : @whos_move = "X"
    puts " "
    puts "#{@whos_move}'s go"
    puts " "
    escape = 0
    until escape == 1
      if @player == @whos_move
        print 'Where would you like to place your piece? : '
        @moved = "s" + gets.chomp.slice(0)
      else
        print "Thinking"
        i = 0
        while i < rand(1..4) do
           sleep 1
           print "."
           i += 1
        end
        @moved = comp_turn
      end
      move_symbol = @moved.to_sym
      if (1..9).include?(@moved.slice(1).to_i) == false
        puts 'Enter a number from 1-9! '
        next
      elsif @board[move_symbol] != " "
        puts "That space is taken!"
        next
      else
        @board[move_symbol] = @whos_move
        escape = 1
      end
    end

  end

end

module Winnable

  attr_reader :winner

  @winner = " "

  def win_state_check 

    win_states = [
      [@board[:s1], @board[:s2], @board[:s3]],
      [@board[:s4], @board[:s5], @board[:s6]],
      [@board[:s7], @board[:s8], @board[:s9]],
      [@board[:s1], @board[:s4], @board[:s7]],
      [@board[:s2], @board[:s5], @board[:s8]],
      [@board[:s3], @board[:s6], @board[:s9]],
      [@board[:s1], @board[:s5], @board[:s9]],
      [@board[:s7], @board[:s5], @board[:s3]]
    ]

    checker = win_states.select { |arr| arr.all? { |val| val == "O" } || arr.all? { |val| val == "X" } }
    if checker.length == 1
      @winner = checker[0][0]
    end

    return @winner
  end
end
module Whopper

  def comp_turn
    blanks = []

    @board.each { |key, val| blanks << key.to_s if val == " " }
    return blanks[rand(blanks.length)]


  end
  
end

# Draw board
class Board 
  include Move
  include Winnable
  include Whopper
  
  attr_accessor :board
  attr_accessor :player

  def setup
    @board = {
      s1: " ",
      s2: " ",
      s3: " ",
      s4: " ",
      s5: " ",
      s6: " ",
      s7: " ",
      s8: " ",
      s9: " ", }

      system("clear") || system("cls") # clears the terminal
      escape = 0
      until escape == 1 do
        print "Would you like to be X or O? "
        @player = gets.chomp.upcase
        if @player == "X" || @player == "O"
          escape = 1
        else
          next
        end
      end
  end

  def draw_board
    system("clear") || system("cls") # clears the terminal each redraw
    puts '                    '
    puts "     #{@board[:s1]} | #{@board[:s2]} | #{@board[:s3]}      "
    puts "     ---------      "
    puts "     #{@board[:s4]} | #{@board[:s5]} | #{@board[:s6]}      "
    puts "     ---------      "
    puts "     #{@board[:s7]} | #{@board[:s8]} | #{@board[:s9]}      "
    puts '                    '   

  end

end

# The game loop
class GameLoop < Board

  current_game = Board.new
  x = 0
  current_game.setup
  current_game.draw_board

  while x < 9
    current_game.player_turn
    current_game.draw_board
    current_game.comp_turn
    win_yet = current_game.win_state_check
    if win_yet == "X" || win_yet == "O"
      system("clear") || system("cls") # clears the terminal
      puts '*****************'
      puts '**             **'
      puts "**   #{win_yet} wins!   **" 
      puts '**             **'
      puts '*****************'
      break
    end
    x += 1
  end

  draw = current_game.win_state_check
  if draw == nil
    puts "**     It's a draw!     **"
    puts "    It would seem that" 
    puts "   the only winning move"
    puts "    is not to play...."
  end
end

GameLoop