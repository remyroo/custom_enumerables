require_relative '../custom_methods'

a = [1, 2, 3]
b = { a: 'apple', b: 'bat' }

puts '#my_map'
p(a.my_map { |el| el * 3 })
p(b.my_map { |_, v| v.upcase })
p a.my_map

puts '#my_map with proc'
multiplier = proc { |el| el * 4 }
p a.my_map(multiplier)

puts '#map?'
p(a.map { |el| el * 3 })
p(b.map { |_, v| v.upcase })
p a.map
