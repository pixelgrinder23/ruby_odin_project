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
    print 'Where would you like to place your piece? : '
    escape = 0
    until escape == 1
      @moved = "s" + gets.chomp.slice(0)
      move_symbol = @moved.to_sym
      if (1..9).include?(@moved.slice(1).to_i) == false
        print 'Enter a number from 1-9! : '
        next
      elsif @board[move_symbol] != " "
        puts "That space is taken!"
        print 'Where would you like to place your piece? : '
        next
      else
        @board[move_symbol] = @whos_move
        escape = 1
      end
    end

  end

end

# Draw board
class Board 
  include Move
  include Winnable
  include Whopper
  
  attr_accessor :board
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
  end

  def draw_board
    system("clear") || system("cls") # clears the terminal each redraw
    p '                    '
    p "     #{@board[:s1]} | #{@board[:s2]} | #{@board[:s3]}      "
    p "     ---------      "
    p "     #{@board[:s4]} | #{@board[:s5]} | #{@board[:s6]}      "
    p "     ---------      "
    p "     #{@board[:s7]} | #{@board[:s8]} | #{@board[:s9]}      "
    p '                    '   

  end

end

module Whopper

  def blank_check
    blanks = []

    @board.each { |key, val| blanks << key if val == " " }
    # p blanks
    
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

# The game loop
class GameLoop < Board

  current_game = Board.new
  x = 0
  current_game.setup
  current_game.draw_board

  while x < 9
    current_game.player_turn
    current_game.draw_board
    current_game.blank_check
    win_yet = current_game.win_state_check
    if win_yet == "X" || win_yet == "O"
      puts "#{win_yet} wins!" 
      break
    end
    x += 1
  end

  draw = current_game.win_state_check
  if draw == nil
    puts "It's a draw!"
    puts "It would seem that the only winning move is not to play...."
  end
end

GameLoop

# Computer opponent