require_relative "AI.rb"
require_relative "Game.rb"
require_relative "rttt.rb"

tictactoe = TicTacToe.new
game = Game.new(tictactoe,AI.new)

game.start
