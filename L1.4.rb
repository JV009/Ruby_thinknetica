print "write 'a'. "
a = gets.chomp.to_i

print "Write 'b'. "
b = gets.chomp.to_i

print " Write 'c'. "
c = gets.chomp.to_i

dis = b ** 2 - (4 * a * c)

if dis < 0 
	puts "#{dis}, there are no roots!"
elsif dis == 0 
	puts "#{dis}, x = #{(-1) * b / (2 * a)}"
else 
	puts "#{dis}, x1 = #{( (-1) * b - Math.sqrt(dis) ) / (2 * a)}, x2 = #{( (-1) * b + Math.sqrt(dis) ) / (2 * a)}"
end