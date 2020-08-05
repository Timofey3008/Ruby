puts (1..1000).select { |mul| mul % 3 == 0 or mul % 5 == 0 }.sum
