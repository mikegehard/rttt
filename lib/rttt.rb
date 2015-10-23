class TicTacToe
	attr_reader :board
	
	def initialize
		@board = Array.new(9,nil)
		@turn = true
		@size = 9
	end 

	def move(index, turn)
		@board[index - 1] = (turn ? "X" : "O")
	end

	def set_board(new_board)
		(0...board.length).each do |index|
			@board[index] = new_board[index]
		end
	end

	def winner?
		combinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
		for combination in combinations
			if (@board[combination[0]].eql?(@board[combination[1]]) && @board[combination[0]].eql?(@board[combination[2]]) && @board[combination[0]] != nil )
				return (@turn ? "X" : "O")
			end
		end
		return nil
	end

	def draw?
		count = 0
		for tile in @board
			if (!tile.eql?(nil))
				count = count + 1
			end
		end

		if (has_winner? == false)
			if(count == board.length)
				return true
			else
				return false
			end
		else
			return false
		end
	end

	def has_winner?
		!!winner?
	end

	def reset!
		(0...board.length).each do |i|
			@board[i] = nil
	end

	def over?
		has_winner? || draw?
	end

	end

end