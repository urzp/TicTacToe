require '../classes'

describe Game_place do

  context "test #check_win method" do
    it "should return true if @board instanse have a line of x" do
      a_game = Game_place.new
      a_game.board[1] ="X"
      a_game.board[2] ="X"
      a_game.board[3] ="X"

      player_1 = Human.new
      player_1.marker="X"

      a_game.draw_board

      expect(a_game.check_win(player_1)).to eq true
    end

    it "should return true if @board instanse have a line of x" do
      a_game = Game_place.new
      a_game.board[1] ="X"
      a_game.board[2] ="X"
      a_game.board[3] ="X"

      player_1 = double('human')
      allow(player_1).to receive(:marker) {"X"}
      allow(player_1).to receive(:name) {"Player"}

      a_game.draw_board

      expect(a_game.check_win(player_1)).to eq true
    end
  end

context "test #check_full_board" do

  it "should return true if @board full" do
    a_game = Game_place.new
    a_game.board[1] ="X"
    a_game.board[2] ="X"
    a_game.board[3] ="X"
    a_game.board[4] ="r"
    a_game.board[5] ="X"
    a_game.board[6] ="e"
    a_game.board[7] ="X"
    a_game.board[8] ="X"
    a_game.board[9] ="X"



    a_game.draw_board

    expect(a_game.check_full_board).to eq true
  end
end
end
