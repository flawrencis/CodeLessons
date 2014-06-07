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

  def my_all?
    if block_given?
      self.my_each { |element| return false unless (yield(element) == true) }
    else
      self.my_each { |element| return false unless element == true}
    end
    true
  end

  def my_any?
    if block_given?
      self.my_each { |element| return true if (yield(element) == true) }
    else
      self.my_each { |element| return true if element == true}
    end
    false
  end

  def my_none?
    if block_given?
      self.my_each { |element| return false if (yield(element) == true) }
    else
      self.my_each { |element| return false if element == true}
    end
    true
  end

  def my_count
    count = 0
    if block_given?
      self.my_each { |element| count +=1 if (yield(element) == true)}
    else
      self.my_each { |element| count += 1 }
    end
    count
  end

  def my_map
    output = []
    return self unless block_given?
    self.my_each { |element| output << (yield(element))}
    output
  end

  def my_inject(num=nil)
    if num == nil
      total = self.first
    else
      total = num
    end

    self.my_each do |element|
      total = (yield(total, element))
    end
    total
  end


end

puts [1, 2, 3, 4].inject(0) { |result, element| result + element }
puts [1, 2, 3, 4].my_inject(0) { |result, element| result + element }

longest = %w{ cat sheep bear }.my_inject do |memo, word|
   memo.length > word.length ? memo : word
end
puts longest

















