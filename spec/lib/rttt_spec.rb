require 'spec_helper'
require 'rttt'

describe TicTacToe do
	let (:game) {TicTacToe.new}

	it "has a board" do
		expect(game.board).to eq(Array.new(9,nil))
	end

	it "can make a move" do
		game.move(3,true)
		expect(game.board[2]).to eq('X')
	end

	it "has a winner" do
		board = ['X','X','X',
						'O','X','O',
						'O','O','X']
		game.set_board(board)
		expect(game.winner?).to eq(true)
	end
end