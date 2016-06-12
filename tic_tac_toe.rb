class Game_place
  def initialize()
    @board=Array.new(10)
  end
  
  def draw_board
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

