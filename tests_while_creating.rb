include TicTacToe

game=Game_place.new
a_man=Human.new
comp=Computer.new

coin_toss(a_man, comp)

game.board[4]=a_man.marker
game.board[2]=a_man.marker
game.board[1]=a_man.marker
game.board[3]=a_man.marker
game.board[7]=a_man.marker
game.board[6]=a_man.marker
game.board[5]=a_man.marker
game.board[8]=a_man.marker

game.draw_board

puts comp.turn(game.board, a_man)
#game.turn(comp.turn(game.board, a_man), comp.marker)
