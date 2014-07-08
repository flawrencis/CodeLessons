require './binary_search'

class ChessBoard	
	attr_reader :board, :square, :all_indexes, :tree

	def initialize
		board = []

		for index in 0..7
			board << []
			for index2 in (0..7)
				board[index] << 0
			end
		end
		@all_indexes = all_indexes()
		build_tree
		@board = board
		@board
	end

	#Builds a list of all possible indexes that the knight can visit (it can go everywhere!)
	def all_indexes
		index_list = []
		for y_index in 0..7
			for x_index in 0..7
				index_list << [y_index, x_index]
			end
		end
		index_list
	end

	def build_tree
		@tree = BinarySearchTree.new(@all_indexes)
	end

	#Retrieve square value
	def get_square(y,x)
		@square = @board[y][x]
		@square
	end

	#Set square's value - useful for debugging
	def set_square(y,x,value)
		@board[y][x] = value
	end

	#Return array list of legal moves from current position
	def possible_moves(y_pos, x_pos, moves_list=[[y_pos,x_pos]])
		
		return moves_list if moves_list.length > 64

		move_square = y_pos+2, x_pos+1
		moves_list << move_square if check_legal_move(move_square[0],move_square[1]) 

		move_square = y_pos+2, x_pos-1
		moves_list << move_square if check_legal_move(move_square[0],move_square[1])

		move_square = y_pos-2, x_pos+1
		moves_list << move_square if check_legal_move(move_square[0],move_square[1])

		move_square = y_pos-2, x_pos-1
		moves_list << move_square if check_legal_move(move_square[0],move_square[1])

		move_square = y_pos+1, x_pos+2
		moves_list << move_square if check_legal_move(move_square[0],move_square[1])

		move_square = y_pos+1, x_pos-2
		moves_list << move_square if check_legal_move(move_square[0],move_square[1])

		move_square = y_pos-1, x_pos+2
		moves_list << move_square if check_legal_move(move_square[0],move_square[1])

		move_square = y_pos-1, x_pos-2
		moves_list << move_square if check_legal_move(move_square[0],move_square[1])

		moves_list.each { |move| possible_moves(move[0], move[1], moves_list) }
		return moves_list
	end

	#Checks if a move is legal (i.e. not on the board) - helper function for possible_moves
	def check_legal_move(y,x)
		if y > 7 || y < 0
			return false
		elsif x > 7 || x < 0
			return false
		else
			return true
		end
	end

# 	def build_moves_list(origin, target)		
# 		moves_list = possible_moves(origin[0], origin[1])
# 		discovered = [origin]

# 		until moves_list.empty?
# 			current_position = moves_list.shift
# 			return current_position if current_position == target
# 			moves_list += 
# 		end
# 	end
end

chess = ChessBoard.new()
chess_board = chess.board

chess_board.each do |line|
	p line
end

# p chess.tree.breadth_first_search([4,3])
# chess.tree.display_tree {|x| print "#{x} "}
# print "\n"

p chess.possible_moves(0,0)

# MoveSearch = BinarySearchTree.new(chess_board)


# p chess.build_moves_list([3,3], [4,3])




