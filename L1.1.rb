print "what's your name? "
name = gets.chomp
name.capitalize!

print "what's your height? "
height = gets.chomp.to_i

optimal_weight = (height - 110) * 1.15
if optimal_weight > 0
  puts "#{name}, your optimal weight is #{optimal_weight}!"
  else
  puts "#{name},your weight is already optimal!"
end  