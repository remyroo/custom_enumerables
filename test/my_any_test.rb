require_relative '../custom_methods'

a = [1, 2, 3, 4, 5]
b = { a: 'apple', b: 'bat' }
c = [1, nil, 3]

puts '#my_any?'
p(a.my_any? { |x| x.is_a? Integer })
p(b.my_any? { |_k, v| v.length == 10 })
p c.my_any?(3)

puts '#any?'
p(a.any? { |x| x.is_a? Integer })
p(b.any? { |_k, v| v.length == 10 })
p c.any?(3)
