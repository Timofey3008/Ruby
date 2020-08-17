class Array
  def my_map
    array = []
    if block_given?
      self.each { |value| array << yield(value) }
      array
    else
      self.to_enum(:map)
    end
  end
  def my_map!
    if block_given?
     self.my_map.with_index { |value, i| self[i] = yield(value) }
    else
      self.to_enum(:map)
    end
  end
  def my_reduce
    sum = 0
    self.each do |n|
      sum = yield(sum, n)
    end
    sum
  end
end
array = [1, 2, 3, 4]
# p array.my_map! {|n| n + 2}
# p array.map {|n| n + 2}
# p array.map(&:to_s)
# p array.my_map(&:to_s)
# p array
puts array.my_reduce{|sum, n| sum * n}
puts array.reduce{|sum, n| sum * n}
