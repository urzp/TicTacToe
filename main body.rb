include TicTacToe

game=Game_place.new
a_man=Human.new
comp=Computer.new


puts "********************************"
coin_toss(a_man, comp, game)
game.draw_board
puts "********************************"

while !game.stop do
	current_player = game.who_turn?
	player_chose = current_player.turn(game.board)
	game.turn(player_chose, current_player)
end
