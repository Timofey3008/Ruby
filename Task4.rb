require 'benchmark'
require 'bigdecimal/math'
puts Benchmark.measure { BigMath.PI(10_000)
arr = (100..999).to_a
sum_arr = arr.inject([]) { |sum, elem| sum = sum + arr.map { |num| num * elem } }.select do
|pol|
  string = pol.to_s
  pol = pol.to_s
  pol == string.reverse
end
puts sum_arr.max
}

