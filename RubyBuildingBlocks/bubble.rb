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

#Test Case

array = [51, 200, 34, 2, 2, 5, 30, 66, 899, 10203, 87]
p bubble_sort(array)