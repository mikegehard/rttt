require_relative 'spec_helper'
require_relative '../lib/Game.rb'
require_relative 'GameSpec.rb'
#require "rttt"
#require "AI"

#Test cases for Game
#1) Says hello
#2) displays the board
#3) Asks who will go first, player or AI
#4) Changes turns after each move

describe Game do
	let (:game) {Game.new(TicTacToe.new,AI.new)}

	it "can display a welcome message" do
		expect(game.instructions).to eq("Welcome to Ruby Tic Tac Toe!\nThe board is laid out as follows.\n\n 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n\n Press Enter to continue..")
	end
end