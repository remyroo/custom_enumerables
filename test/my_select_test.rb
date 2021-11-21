require_relative '../custom_methods'

a = [1, 2, 3, 4, 5]
b = { a: 'apple', b: 'bat' }

puts '#my_select'
p(a.my_select { |x| x < 3 })
p(b.my_select { |_k, v| v.length == 3 })
p a.my_select

puts '#select'
p(a.select { |x| x < 3 })
p(b.select { |_k, v| v.length == 3 })
p a.select
