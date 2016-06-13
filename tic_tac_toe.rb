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
  attr_reader :board
  attr_writer :board
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
  
  def turn (place, player)
	@board[place]=player.marker
	draw_board
	
  end
  
  def check_win(player)
	LINES.any? do |line|
	  line.all { |i| i == player.marker}
	end
  end
  
  def check_full_board
    @board.all?{ |i| i != " "}
  end
  
  def Who_turn?
    
  end
end

class Player
  @@instans=[]
  def initialize()
	@marker=nil
	@@instans << self
	puts @@instans
	puts "+++++"
  end
  
  def instanses
	puts @@instans
  end
  
  def marker=(marker)
    @marker=marker
  end
  
  def marker
     @marker
  end
  
  def enimy?(player)
	
  end
end

class Human < Player
  def initialize()
    @name = "Player"
	super
  end
  
  def name
    @name
  end
  
  def turn
    puts "take your turn and puts here number of place where you want to put #{self.marker}"
	selection = gets.to_i
  end
end

class Computer < Player
  def initialize()
    @name="computer"
	super
  end
  
  def name
    @name
  end
  
  def turn(board, enimy)
    if find_win_play(board, enimy) 
	  return find_win_play(board, enimy)
	end
	
	if find_block_play(board, enimy) 
	  return find_block_play(board, enimy)
	end
	
	if find_empty_line(board)
	  return find_empty_line(board)
	end
	
	if find_epty_position(board)
	  return find_epty_position(board)
	end
  end
  
private

  def find_win_play(board, enimy)
	LINES.each do |line|
		if line.select{ |i| board[i] == self.marker }.size > 1 &&  line.select{ |i| board[i] == enimy.marker }.size == 0
			return line.select{ |i| board[i] == " " }[0]
			break
		end
	end
	return false
  end
  
  def find_block_play(board, enimy)
	LINES.each do |line|
		if line.select{ |i| board[i] == enimy.marker }.size > 1 &&  line.select{ |i| board[i] == self.marker }.size == 0
			return line.select{ |i| board[i] == " " }[0]
			break
		end
	end
	return false
  end
  
  def find_empty_line(board)
	LINES.each do |line|
	  if line.all?{ |i| board[i] == " "}
	    return line.select{ |i| board[i] == " " }[0]
	  end
	end
	return false
  end
  
  def find_epty_position(board)
    board.find_index { |val| val == " "}
  end
end




# ------ Nots ------
#  is needed: 
#    human input filter 
#    optimisation draw_board
#    create one method for find_win_play, find_win_play