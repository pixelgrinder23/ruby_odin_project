# Elements

# Game board        - method (draws board / variable for state of each space - empty / X / O)
# Players           - class (@name / )
# Making a move     - class (X or O / location / @turn counter)
# Placed moves      - instances (@location / @XorO)
# checking for win  - method?

# Making moves
module Move

  @whos_move = ""
  attr_reader :move_taken

  @move_taken = [nil, nil]
  
  def player_turn
    @whos_move == "X" ? @whos_move = "O" : @whos_move = "X"
    puts "#{@whos_move}'s go"
    print 'Where would you like to place your piece? : '
    @moved = 0
    until (1..9).include?(@moved)
      @moved = gets.chomp.to_i
      if (1..9).include?(@moved) == false
        print 'Enter a number from 1-9! : '
        next
      else
        @move_taken = [@moved, @whos_move]
      end
    end

    return @move_taken
  end

end

# Draw board
class Board 
  include Move
  
  attr_accessor :a1, :b1, :c1, :a2, :b2, :c2, :a3, :b3, :c3
  def setup
    @a1 = " "
    @b1 = " "
    @c1 = " "
    @a2 = " "
    @b2 = " "
    @c2 = " "
    @a3 = " "
    @b3 = " "
    @c3 = " "
  end

  def update_board(turn)
    location = turn[0].to_i
    player = turn[1]
    # puts "Update Board -  #{location} : #{player}"
    case location
      when 1 then @a1 = player
      when 2 then @b1 = player
      when 3 then @c1 = player
      when 4 then @a2 = player
      when 5 then @b2 = player
      when 6 then @c2 = player
      when 7 then @a3 = player
      when 8 then @b3 = player
      when 9 then @c3 = player
    end
  end

  def draw_board
    system("clear") || system("cls") # Uncomment this line when you're done to clear the terminal each redraw!
    p '                    '
    p "     #{@a1} | #{@b1} | #{@c1}      "
    p "     ---------      "
    p "     #{@a2} | #{@b2} | #{@c2}      "
    p "     ---------      "
    p "     #{@a3} | #{@b3} | #{@c3}      "
    p '                    '

  end

end

# The game loop
class GameLoop < Board
  include Move

  current_game = Board.new
  x = 0
  current_game.setup
  current_game.draw_board

  while x < 9 do
    current_game.update_board(current_game.player_turn)
    current_game.draw_board
    x += 1
  end
end

GameLoop

# Prevent moves in full spaces
# Checking for a winner (either player)
# Computer opponent
# Replace board variables with a hash