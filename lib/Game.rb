require_relative "rttt"
require_relative "ai"

class Game
	attr_reader :tictactoe

	def initialize(tictactoe, ai)
		@tictactoe = tictactoe
		@ai = ai
		@turn = false
	end

	def start
		again = true
		print instructions
		gets
		while (again == true)
			@tictactoe.reset
			pick_first
			play
			print display_board
			print winner
			again = play_again?
		end
	end

	def play_again?
		print "\nWould you like to try again?\n 1.Yes \n 2. No \n"
		choice = gets.chomp.to_i
		return true if choice == 1
		return false if choice == 2
		if choice != 1 || choice != 2
			print "Please enter a valid input (1 or 2) \n"
		end
		play again?
	end

	def instructions
			return_string = "Welcome to Ruby Tic Tac Toe!\nThe board is laid out as follows.\n"
			example_board = [1,2,3,4,5,6,7,8,9]

		rttt = TicTacToe.new
		rttt.set_board example_board
			return_string = return_string + display_board(rttt) + "\n" + "\n Press Enter to continue.."
			return return_string
	end

	def help
		size = @tictactoe.get_board.length
		example_board = Array.new(size,nil)
		(0...size).each do |i|
			example_board[i] = i
		end
		rttt = TicTacToe.new
		rttt.set_board example_board
		return_string = "Please reference the board as follows.\n"
		return_string = return_string + display_board(rttt) + "\nPress Enter to continue.."
		return return_string
	end

	def pick_first
		done = false
		while (!done)
			print "\nWho will go first?"
			print "\n1. Player\n"
			print "2. Computer\n"
			choice = gets.to_i

			if choice == 1
				done = true
				self.turn = true
			elsif choice == 2
				done = true
				self.turn = false
			else
				print "Please enter a valid input. (1 or 2) \n"
			end
		end
	end

	def play
		take_turn until @tictactoe.over
	end

	def take_turn
		if turn
			player_move
		else
			if @tictactoe.get_board.compact.length < 2
				print "Just a sec.."
			end
			@tictactoe.move(@ai.turn(@tictactoe.board), false)
		end
		self.turn = !turn
	end

	def turn
		@turn
	end

	def turn=(turn)
		@turn = turn
	end

	def player_move
		valid = false
		while (!valid)
			print display_board
			print "\nWhere would you like to move?\n"
			move = gets.chomp.to_i
			if @tictactoe.board[move - 1] == nil && move < 10 && move > 0
				valid = true
				@tictactoe.move(move, true)
			elsif move == 0
				print help
				gets
			else
				print "Please enter a valid number, or enter 0 for help!"
			end
		end			
	end

		def winner
			if @tictactoe.draw?
				"\n It's a tie!"
			elsif (!@turn)
				"\nCongratulations, you won!"
			elsif (@turn)
				"\nThe computer won!"
			end
		end

	def display_board(tictactoe = @tictactoe)
		return_string = ""
		string_board = Array.new
		counter = 0
		tictactoe.board.each{|tile|
			if (tile == nil)
				tile = "   "
			else
				tile = " " + tile.to_s + " "
			end
			string_board[counter] = tile
			counter = counter + 1}
			return_string = "\n" + string_board[0] + "|" + string_board[1] + "|" + string_board[2] + "\n" + "-----------" + "\n" + string_board[3] + "|" + string_board[4] + "|" + string_board[5] + "\n" + "-----------" + "\n" + string_board[6] + "|" + string_board[7] + "|" + string_board[8]

			return return_string
	end
end


