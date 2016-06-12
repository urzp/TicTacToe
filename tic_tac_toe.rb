class Game_place
  def initialize()
    @board = Array.new(10, " ")
  end
  
  def draw_board
    puts "-Game Board-||-Number place of board-"
	puts " #{@board[1]} | #{@board[2]} | #{@board[3]} " + " ||  1 | 2 | 3"
	puts "---+---+---" + " || ---+---+---"
	puts " #{@board[4]} | #{@board[5]} | #{@board[6]} " + " ||  4 | 5 | 6"
	puts "---+---+---" + " || ---+---+---"
	puts " #{@board[7]} | #{@board[8]} | #{@board[9]} " + " ||  7 | 8 | 9"
  end
  
  def check_win
  end
  
  def check_full_board
  end
end

class Player
end

class Human < Player
  def initialize()
  end
  
  def turn
  end
end

class Computer < Player
  def initialize()
  end
  
  def turn
  end
end

