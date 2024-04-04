alphabet = ('a'..'z').to_a
vowels = {}
alphabet.each_with_index { |a, i| vowels [a] = i + 1 if 'eyuioa'.include?(a)}

puts vowels

