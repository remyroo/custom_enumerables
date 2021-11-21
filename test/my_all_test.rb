require_relative '../custom_methods'

a = [1, 2, 3, 4, 5]
b = { a: 'apple', b: 'bat' }
c = [3, 3, 3]

puts '#my_all?'
p(a.my_all? { |x| x.is_a? Integer })
p(b.my_all? { |_k, v| v.length == 3 })
p c.all?(3)
p a.my_all?

puts '#all?'
p(a.all? { |x| x.is_a? Integer })
p(b.all? { |_k, v| v.length == 3 })
p c.all?(3)
p a.all?
