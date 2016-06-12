LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

module TicTacToe

  def coin_toss (player1, player2)
	if rand > 0.5 
	  player1.marker="X"
	  player2.marker="O"
	 else
	  player1.marker="O"
	  player2.marker="X"	  
	end
	puts "Ok, #{player1.name} play with marker \"#{player1.marker}\" and #{player2.name} play with marker \"#{player2.marker}\" "
  end
end 

class Game_place
  def initialize()
    @board = Array.new(10, " ")
	@board[0] = nil # unnecessary position of the board
  end
  
  def draw_board
    puts "-Game Board-||-Number place of board-"
	puts " #{@board[1]} | #{@board[2]} | #{@board[3]} " + " ||  1 | 2 | 3"
	puts "---+---+---" + " || ---+---+---"
	puts " #{@board[4]} | #{@board[5]} | #{@board[6]} " + " ||  4 | 5 | 6"
	puts "---+---+---" + " || ---+---+---"
	puts " #{@board[7]} | #{@board[8]} | #{@board[9]} " + " ||  7 | 8 | 9"
  end
  
  def turn (place, x_o)
	@board[place]=x_o
  end
  
  def check_win(player)
	LINES.any? do |line|
	  line.all { |i| i == player.marker}
	end
  end
  
  def check_full_board
    @board.all?{ |i| i != " "}
  end
end

class Player
  def initialize()
	@marker=nil
  end
  
  def marker=(marker)
    @marker=marker
  end
  
  def marker
     @marker
  end
end

class Human < Player
  def initialize()
    @name = "Player"
  end
  
  def name
    @name
  end
  
  def turn
    
  end
end

class Computer < Player
  def initialize()
    @name="computer"
  end
  
  def name
    @name
  end
  
  def turn
  end

end

