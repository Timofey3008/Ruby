fib = 1
second = 0
sum = 0
while fib <= 4000000 do
  fib = fib + second
  second = fib - second
  if fib % 2 == 0 then
    sum = sum + fib
  end
end
puts sum