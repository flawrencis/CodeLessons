#Constructor for the individual nodes
class Node
	attr_accessor :value, :left_child, :right_child

	def initialize(value, left_child=nil, right_child=nil)
		@value = value
		@left_child = left_child
		@right_child = right_child
	end
end

#Constructor for our Binary Tree, includes three search methods
class BinarySearchTree
	attr_accessor :array, :tree

	def initialize(array, tree=nil)
		@array = array
		@tree = tree

		build_tree(@array)
	end

	#Sorts the array using the merge_sort method, and builds the tree.
	def build_tree(array, left=0, right=array.length-1)
		return if left > right

		array.sort!

		index_mid = left + (right-left) / 2	
		node = Node.new(array[index_mid])			
			
		node.left_child = build_tree(array, left, index_mid-1)			
		node.right_child = build_tree(array, index_mid+1, right)		

		@tree = node
		@tree
	end

	#ITERATIVE BREADTH FIRST SEARCH method
	def breadth_first_search(query)
		queue = []
		root = @tree.value

		return @tree if root == query	#Returns the root item if the query matches

		left_child = @tree.left_child
		right_child = @tree.right_child

		queue << left_child if left_child != nil
		queue << right_child if right_child != nil
		
		loop do
			return nil if queue.empty?

			node = queue.shift
			return node if query == node.value

			queue << node.left_child if node.left_child != nil
			queue << node.right_child if node.right_child != nil
		end
	end

	#ITERATIVE DEPTH FIRST SEARCH METHOD
	def depth_first_search(query)
		stack = [@tree]

		loop do
			return nil if stack.empty?

			node = stack.pop
			return node if query == node.value

			stack.push node.left_child if node.left_child != nil
			stack.push node.right_child if node.right_child != nil
		end
	end
	
	#RECURSIVE DEPTH FIRST SEARCH METHOD
	def dfs_recursive(query, node=@tree)		
		return nil if node.nil?
		return node if query == node.value

		left_search = node.left_child != nil ? dfs_recursive(query, node.left_child) : nil
		return left_search if left_search != nil
		right_search = node.right_child != nil ? dfs_recursive(query, node.right_child) : nil
		return right_search if right_search != nil 
	end

	#Use this function for debugging / displaying the tree.
	def display_tree()						
		list = []
		yield @tree.value
		left_child = @tree.left_child
		right_child = @tree.right_child

		list << left_child if left_child != nil
		list << right_child if right_child != nil

		loop do
			break if list.empty?
			node = list.shift
			yield node.value
			list << node.left_child if node.left_child != nil
			list << node.right_child if node.right_child != nil
		end
	end
end