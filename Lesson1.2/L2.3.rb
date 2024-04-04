i1 = 0
i2 = 1
fibonacci = []
while i1 < 100
  fibonacci << i1
  i1, i2 = i2, (i1 + i2)	
end

puts fibonacci
