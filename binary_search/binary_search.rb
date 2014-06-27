class Node
	attr_accessor :value, :left_child, :right_child

	def initialize(value, left_child=nil, right_child=nil)
		@value = value
		@left_child = left_child
		@right_child = right_child
	end
end

class BinarySearchTree
	attr_accessor :array, :tree

	def initialize(array, tree=nil)
		@array = array
		@tree = tree

		build_tree(@array)
	end

	def build_tree(array, left=0, right=array.length-1)
		return if left > right

		array = merge_sort(array)

		index_mid = left + (right-left) / 2	
		node = Node.new(array[index_mid])			
			
		node.left_child = build_tree(array, left, index_mid-1)			
		node.right_child = build_tree(array, index_mid+1, right)		

		@tree = node
		@tree
	end

	def display_tree()						#Uses breadth first traversion to display the tree.
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

test_array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
test_array2 = [9,8,7,6,5,4,3,2,1,0]
test_array3 = ['a', 'c', 'd', 'u', 'n', 'z', 'uganda', 'cow']

tree = BinarySearchTree.new(test_array2)
tree.display_tree {|x| print "#{x} "}
print "\n"

p tree.depth_first_search(4)
