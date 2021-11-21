require_relative '../custom_methods'

a = [1, 2, 3]
b = (1..3)
c = { a: 'apple', b: 'bat' }

puts '#my_inject'
# sum some numbers
p a.my_inject(:+)
p(a.my_inject { |sum, n| sum + n })
p(b.my_inject { |sum, n| sum + n })

p a.my_inject(3, :+)
p(a.my_inject(3) { |sum, n| sum + n })

# longest word
p(c.my_inject('') { |sum, (_k, v)| sum.length > v.length ? sum : v })

# Test my_inject with a method that multiplies all the elments of an array together:
p multiply_els([2, 4, 5]) #=> 40

puts '#inject?'
# sum some numbers
p a.inject(:+)
p(a.inject { |sum, n| sum + n })
p(b.inject { |sum, n| sum + n })

p a.inject(3, :+)
p(a.inject(3) { |sum, n| sum + n })

# longest word
p(c.inject('') { |sum, (_k, v)| sum.length > v.length ? sum : v })
