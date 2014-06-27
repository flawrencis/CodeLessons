class Node
	attr_accessor :value, :parent, :left_child, :right_child

	def initialize(value, left_child=nil, right_child=nil)
		@value = value
		@left_child = left_child
		@right_child = right_child
	end
end

def build_tree(array, left=0, right=array.length-1)
	return if left > right

	index_mid = left + (right-left) / 2	
	node = Node.new(array[index_mid])			
		
	node.left_child = build_tree(array, left, index_mid-1)			
	node.right_child = build_tree(array, index_mid+1, right)		

	node
end

test_array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
test_array2 = [10,9,8,7,6,5,4,3,2,1,0]
