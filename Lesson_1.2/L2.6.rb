bascet = {}

loop do
  puts "write the name of the product. To complete write 'Stop'. "
  product = gets.chomp
  break if product == "Stop" 

  puts "Write the price of the product. "
  price = gets.chomp.to_f


  puts "Write the quantity of the product. "
  quantity = gets.chomp.to_f
  bascet[product] = { product: product, price: price, quantity: quantity, summ: price * quantity } 
end

puts "Your purchase:"
bascet.each do |k, v|
  puts "#{k} - price: #{v[:price]}, quantity: #{v[:quantity]}, total price: #{v[:summ]}"
end  

puts "Total cost:"
puts bascet.reduce(0) { |sum, (_, product)| sum + product[:summ] }