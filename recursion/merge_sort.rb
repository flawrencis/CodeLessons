# The merge_sort function takes an array of unordered objects, 
# and returns an array of ordered objects, using a merge sort algorithm.

def merge_sort(array)
	len = array.length
	return array if len == 1 				#Base case set to an array size of 1
	
	array1 = array[0..(len/2)-1]			#Split the array in half
	array2 = array[len/2..-1]				#Array two gets the longer half if it's an odd length
	a1 = merge_sort(array1)					#Split array1 in half again recursively
	a2 = merge_sort(array2)					#Split array2 in half again recursively
	merge(a1, a2)							#Call the merge function on the split arrays
end


#Merges two arrays into one array while simultaneously sorting them by value.  
#Prioritises lower values, iterating from left to right over both arrays.
def merge(array1, array2, merged_array=[])
	len_of_a1 = array1.length									#Get length of arrays and compare to the array's index
	len_of_a2 = array2.length
	index1 = 0													#Set the starting index for both arrays - always 0 since we are going left to right.
	index2 = 0

	while index1 < len_of_a1 and index2 < len_of_a2				#This loop continues until the end of one of the arrays is reached
		if array1[index1] < array2[index2]						#It compares the index values of both arrays, and appends the one that is lower in value
			merged_array << array1[index1]
			index1 += 1
		else
			merged_array << array2[index2]
			index2 += 1
		end
	end

	if index1 < len_of_a1										#Appends any remaining values to the merged array
		merged_array += array1[index1..-1]						
	elsif index2 < len_of_a2
		merged_array += array2[index2..-1]
	end
	merged_array												#Returns the merged array
end

#--------------------------------------------->

#INITIALISE TESTS
array = [10,9,8,7,6,5,4,3,2,1]							#Test Case 1 - Counting backwards
array2 = [-32, 2000, 54, -3, 77, 91, 45, 8, 101, 54, 1]			#Test Case 2 - Negative numbers, repeating numbers, non-sequential
array3 = ['a', 'c', 'd', 'u', 'n', 'z', 'uganda', 'cow']		#Test Case 3 - Strings / Letters
#PRINT TESTS TO CONSOLE (Results in comments)
p merge_sort(array)					#=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p merge_sort(array2)				#=> [-32, -3, 1, 8, 45, 54, 54, 77, 91, 101, 2000]
p merge_sort(array3)				#=> ["a", "c", "cow", "d", "n", "u", "uganda", "z"]