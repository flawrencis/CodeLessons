module Enumerable
  
  def my_each
    return self unless block_given?
    for element in self
    	yield(element)
    end
  end

  def my_each_with_index
  	return self unless block_given?
  	index = 0
  	self.my_each { |element| yield(element, index); index += 1}
  end

  def my_select
  	output = []
  	return self unless block_given?
  	self.my_each { |element| output << element if yield(element)}
  	output
  end

end

