require_relative './enumerator'

# Step 1

puts "Step 1: my_each"

[5, 6, 7, 8, 9, 10].my_each {|value| puts value }

puts

# Step 2

puts "Step 2: my_each_with_index"

[5, 6, 7, 8, 9, 10].my_each_with_index {|value, index| puts "#{value}, #{index}" }

puts

# Step 3

puts "Step 3: my_select"

my_result =  [5, 6, 7, 8, 9, 10].my_select {|value| value > 2 && value < 8 }
puts my_result

puts

# Step 4

puts "Step 4: my_all?"

my_result =  ['a', 'b', 'c', 1].my_all? {|value| value.is_a? String }
puts my_result

puts

# Step 5

puts "Step 6: my_any?"

my_result =  [5, 6, 7, 8, 9, 10].my_any? {|value| value > 2 }
puts my_result

puts

# Step 6

puts "Step 6: my_none?"

my_result =  [5, 6, 7, 8, 9, 10].my_none? {|value| value > 2 }
puts my_result

puts

# Step 7

puts "Step 7: my_count"

my_result =  [5, 6, 7, 8, 9, 10].my_count
puts my_result

puts

# Step 8

puts "Step 8: my_map"

my_result =  [5, 6, 7, 8, 9, 10].my_map {|value| value ** 2 }
puts my_result

puts

# Step 9

puts "Step 9: my_inject"

my_result =  [5, 6, 7, 8, 9, 10].my_inject(1) {|product, n| product * n }
puts my_result

puts

# Step 10

puts "Step 10: my_inject with multiply_els method"

def multiply_els arr
	arr.my_inject{ | accum, val| accum * val }
end

puts multiply_els [2,4,5]

puts

# Step 11 and Step 12

puts "Step 11 and 12: my_map with block or proc"

proc = Proc.new { | element |  element * 3 }
my_result = [5, 6, 7, 8, 9, 10].my_map(proc).my_map { | element |  element * 3 }

puts my_result