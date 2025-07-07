print "a? "
a = gets.to_i

# if a > 0
#   puts "Positive"
# else
#   if a == 0
#     puts "Zero"
#   else
#     puts "Negative"
#   end
# end

if a > 0
  puts "Positive"
elsif a == 0
  puts "Zero"
else
  puts "Negative"
end

print "name? "
name = gets.chomp
if name == "KSU"
  puts "Hello"
else
  puts "Hi!"
end

q = 5
puts "Three" if q == 3
puts "Not Three" unless q == 3