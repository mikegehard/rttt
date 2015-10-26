require_relative 'spec_helper'
require_relative '../lib/Game.rb'
require_relative 'AISpec.rb'

#Test cases:
#describe the AI (artifical intel)
#1) it can make a random move on an empty board
#2) it can make a move to win the game
#3) it can move to block the other player
#4) it can go through possible moves to win the game

describe AI do
	let (:game) {TicTacToe.new}
	let (:ai) {AI.new}
	let (:default_board) {Array.new(9,nil)}

	it "can make a random unoccupied move on the board" do
		board = ['X',nil,'O',nil,'O',nil,'X',nil,'']
		expect(ai.Turn(board)).to be_within(4).of(5)
	end

	it "can make a move to win the game" do
		board = ['O', 'O', nil,
						 nil, nil, nil,
						 nil, nil, nil]
		expect(ai.check_for_two('O', board)).to eq(3)
	end

	it "can make a move to block the player" do
		board = ['X', 'X', nil,
						 nil, nil, nil,
						 nil, nil, nil]
		expect(ai.check_for_two('X', board)).to eq(3)
	end

	it "can make a move to a random unoccupied corner space" do
		expect(ai.random_corner(default_board)).to satisfy {|i| i == 1 || i == 3 || i == 7 || i == 9}
	end

	it "returns -1 if there are no corners available" do
		board = ['X', nil, 'O',
						 nil, nil, nil,
						 'O', nil, 'X']
		expect(ai.random_corner(board)).to eq(-1)
	end

	it "checks to see if the middle is available and occupies it when available" do
		expect(ai.middle(default_board)).to eq(5)
	end

	it "can go through all strategies and makes the best move available" do
		board = ['X', nil, 'O',
						 nil, nil, nil,
						 'O', nil, 'X']
		expect(ai.Turn(board)).to eq(5)
	end

	it "can make a random move" do
		expect(ai.random_move(default_board)).to satisfy {|i| i = 0...9}
	end


end