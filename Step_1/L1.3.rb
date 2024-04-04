print "Write the lenght of the first side of thew tringle. "
f_side = gets.chomp.to_i

print "Write the lenght of the second side of thew tringle. "
s_side = gets.chomp.to_i

print "Write the lenght of the third side of thew tringle. "
t_side = gets.chomp.to_i

if f_side + s_side < t_side || s_side + t_side < f_side || t_side + f_side < s_side
  puts "Triangle with such a sides is impossible!"
end

sides = [f_side, s_side, t_side]
max_side = [f_side, s_side, t_side].max
other_side = sides - [max_side]

if max_side ** 2 == other_side.reduce(0) {|sum, side| sum + side ** 2}
  puts "Right triangle!"
end

if f_side == s_side || s_side == t_side || t_side == f_side
  puts "Isosceles triangle!"
end

if f_side == s_side && f_side == t_side
  puts "Equilateral triangle!"
end