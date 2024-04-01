print "Write the base of triangle. "
base = gets.chomp.to_i

print "Write the triangle height. "
height = gets.chomp.to_i

area_3 = 0.5 * base * height

if base.to_i <= 0
	puts "Triangle with such a base is impossible!"
elsif 
	height.to_i <= 0
	puts "Triangle with such a height is impossible!"
else
	puts "The area of triangle equal #{area_3}"
end

		


