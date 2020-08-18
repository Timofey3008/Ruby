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
  def my_reduce(sum = nil, symbol = nil)
    if sum.nil? && symbol.nil?
      sum = self.first
      index = 0
      self.each do |n|
        if index != 0
        sum = yield(sum, n)
        end
        index += 1
      end
    end
    if sum.is_a?(Integer) && symbol.nil?
      self.each do |n|
        sum = yield(sum, n)
      end
    end
    if symbol != nil
      self.each do |n|
        sum = n.send(symbol, sum)
      end
    end
    if sum.is_a?(Symbol)
      memo = self.first
      index = 0
      self.each do |n|
        if index != 0
        memo = memo.send(sum, n)
        end
        index += 1
        end
      sum = memo
    end
    sum
  end
end
array = [1, 2, 3, 4]
p array.my_map! {|n| n + 2}
p array.map {|n| n + 2}
p array.map(&:to_s)
p array.my_map(&:to_s)
puts array.my_reduce(8){|sum, n| sum * n}
puts array.reduce(8){|sum, n| sum * n}
puts array.reduce(8, :+)
puts array.my_reduce(8, :+)
puts array.reduce(:*)
puts array.my_reduce(:*)
puts array.reduce
