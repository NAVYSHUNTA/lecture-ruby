PATH = "sample.txt"
file = File.open PATH, "r"

while line = file.gets&.chomp
  puts line
end

file.close