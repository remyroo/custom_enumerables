require_relative '../custom_methods'

a = [1, 2, 3]
b = { a: 'apple', b: 'bat' }
c = []

puts '#my_none?'
p a.my_none?(1)
p(b.my_none? { |_k, v| v.length == 1 })
p c.my_none?

puts '#none?'
p a.none?(1)
p(b.none? { |_k, v| v.length == 1 })
p c.none?
