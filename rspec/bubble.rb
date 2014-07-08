# BUBBLE SORT METHOD
def bubble_sort(unsorted_array)
	loop_length = unsorted_array.length - 1 									#Sets the duration of our loop

	while loop_length > 0
		
		unsorted_array.each_with_index do |item, index|
			next_item = unsorted_array[index+1]
			
			if next_item.nil?											#End loop if you reach the end of the array
				break	
			elsif item > next_item
				unsorted_array.insert(index+1, unsorted_array.delete_at(index))		#"Moves" the number down in the array		
			end
		
		end
		loop_length -= 1												#Loop until this reaches 0
	end
	unsorted_array																#Return the array
end


# BUBBLE SORT BY METHOD - ACCEPTS BLOCK
def bubble_sort_by(unsorted_array)
	loop_length = unsorted_array.length - 1 									

	while loop_length > 0
		
		unsorted_array.each_with_index do |item, index|
			current_item = unsorted_array[index]
			next_item = unsorted_array[index+1]
			
			if next_item.nil?											
				break	
			elsif yield(current_item, next_item) > 0 
				unsorted_array.insert(index+1, unsorted_array.delete_at(index))			
			end
		
		end
		loop_length -= 1												
	end
	unsorted_array																
end



#TEST CODE

array = [51, 200, 34, 2, 2, 5, 30, 66, 899, 10203, 87]
word_array = ["hi","hello","hey"]

p bubble_sort(array)
p bubble_sort_by(word_array) { |left, right| left.length - right.length }
