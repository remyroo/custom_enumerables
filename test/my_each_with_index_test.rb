require_relative '../custom_methods'

a = [1, 2, 3, 4, 5]
b = { a: 'apple', b: 'bat' }

puts '#my_each_with_index'
a.my_each_with_index { |x, i| puts "#{i}: #{x}" }
b.my_each_with_index { |x, i| puts "#{i}: #{x}" }
p a.my_each_with_index

puts '#each_with_index'
a.each_with_index { |x, i| puts "#{i}: #{x}" }
b.each_with_index { |x, i| puts "#{i}: #{x}" }
p a.each_with_index
