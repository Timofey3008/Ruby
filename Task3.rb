require "Prime"
num = 600851475143
prime = 0
large_prime = 0
while num != 1 do
  prime = Prime.detect { |prime| num % prime == 0 }
  num = num / prime
  if prime > large_prime
    large_prime = prime
  end
end
puts large_prime

