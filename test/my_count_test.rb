require_relative '../custom_methods'

a = [1, 2, 4, 2]
b = { a: 'apple', b: 'bat' }

puts '#my_count'
p a.my_count
p a.my_count(2)
p b.my_count
p(b.my_count { |_k, v| v == 'apple' })

puts '#count?'
p a.count
p a.count(2)
p b.count
p(b.count { |_k, v| v == 'apple' })
