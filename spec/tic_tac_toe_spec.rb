require '../classes'

describe Game_place do

  context "test #check_win method" do
    it "should return true if @board instanse have a line of x" do
      a_game = Game_place.new
      a_game.board[1] ="X"
      a_game.board[2] ="X"
      a_game.board[3] ="X"

      player_1 = double('player')
      allow(player_1).to receve(:marker) {"X"}
      expect(a_game.check_win(player_1)).to eq false
    end

  end

end
