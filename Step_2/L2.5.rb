puts "Write the day. "
day = gets.chomp.to_i

puts "Write the month. "
month = gets.chomp.to_i

puts "Write the year. "
year = gets.chomp.to_i

days_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
if year % 4 == 0 && year % 100 == 0 && year % 400 == 0
  days_month[1] = 29
elsif year % 4 == 0 && year % 100 != 0
   days_month[1] = 29  
end
	
summ = 0
for i in (0...month-1) do
  summ = summ + days_month[i]
end

puts summ + day
