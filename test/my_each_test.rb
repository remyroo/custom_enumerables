require_relative '../custom_methods'

a = [1, 2, 3, 4, 5]
b = { a: 'apple', b: 'bat' }

puts '#my_each'
a.my_each { |x| puts x }
b.my_each { |k, v| puts "#{k} => #{v}" }
p a.my_each

puts '#each'
a.each { |x| puts x }
b.each { |k, v| puts "#{k} => #{v}" }
p a.each
