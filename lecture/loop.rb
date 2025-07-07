a = 5
while a > 0
  puts a
  a -= 1
end

array = [10, 30, 50, 80]
# puts "[array]"
# for ele in array
#   puts ele
# end

puts "[array]"
array.each do |ele|
  puts ele
end

# array.each {|ele|
#   puts ele
# }

5.times do |i|
  print "*"
end
puts