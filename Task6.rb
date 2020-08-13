sum_squares = (1..100).reduce { |sum, value| value**2 + sum }
squares_sum = (1..100).reduce { |sum, value| sum += value }**2
puts squares_sum - sum_squares