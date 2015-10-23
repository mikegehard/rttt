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
		expect(game.winner?).to eq('X')
	end

	it "is a draw" do
		board = ['X','O','X',
						'X','O','X',
						'O','X','O']
		game.set_board(board)
		expect(game.draw?).to eq(true)
	end

	it "can reset the game" do
		board = ['X','O','X',
						'X','O','X',
						'O','X','O']
		game.set_board(board)
		game.reset!
		expect(game.board[0]).to eq(nil)
	end

	it "knows when the game is over" do 
		board = ['X','O','X',
						'X','O','X',
						'O','X','O']
		game.set_board(board)
		expect(game.over?).to eq(true)
	end

	it "lets you know who the winner is" do
		board = ['X','X','X',
						'X','O','X',
						'O','X','O']
		game.set_board(board)
		game.has_winner?
		expect(game.winner?).to eq('X')
	end

end