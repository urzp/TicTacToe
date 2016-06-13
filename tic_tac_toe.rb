LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

module TicTacToe

  def coin_toss (player1, player2, game)
	if rand > 0.5 
	  player1.marker="X"
	  player2.marker="O"
	  game.start=player1
	 else
	  player1.marker="O"
	  player2.marker="X"	
	  game.start=player2	  
	end
	puts "Ok, #{player1.name} play with marker \"#{player1.marker}\" and #{player2.name} play with marker \"#{player2.marker}\" "
    puts "#{game.who_turn?.name} will start"
 end
end 

class Game_place
  attr_reader :board, :stop
  attr_writer :board
  def initialize()
    @board = Array.new(10, " ")
	@board[0] = nil # unnecessary position of the board
	@stop = false
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
    if !place_empty?(place)
	  puts "This place has been already done"
	  puts "Take an empty place"
	  return false
	else 
	  @board[place]=player.marker
	  draw_board
	  check_win(player)
	  check_full_board
	  @turn = player.enimy?
	end
  end
  
  def place_empty?(place)
	board[place] == " "
  end
  
  def start=(player)
    @turn = player
  end
  
  def check_win(player)
    if LINES.any?{ |line| line.all? { |i| @board[i] == player.marker} }
	  	puts "#{player.name} win!!!"
		@stop = true
		return true
	end
  end
  
  def check_full_board
    if @board.all?{ |i| i != " "}
	  puts "Isn't any empty place"
	  @stop = true
	end
  end
  
  def who_turn?
    @turn
  end
end

class Player
  @@instans=[]
  def initialize()
	@marker=nil
	@@instans << self
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
  
  def enimy?
	@@instans.select{ |i| self != i}[0]
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
  
  def turn(board)
    selection = 0
    puts "take your turn and puts here number of place where you want to put #{self.marker}"
	while !selection.between?(1, 9) 
	  selection = gets.to_i
	  if !selection.between?(1, 9)
	    puts "Wrong place number! Please put the number between 1..9 " 
	  end
	end
	return selection
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
  
  def turn(board, enimy=self.enimy?)
    return 5 if board[5] == " "
  
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
#    optimisation draw_board
#    create one method for find_win_play, find_win_play
#    create one method turn for comp if 5 is empty
