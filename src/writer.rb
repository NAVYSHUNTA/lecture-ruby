PATH = "sample.txt"
file = File.open PATH, "w"

file.puts "Hello"
file.puts ""
file.write "書いたよ"
file.puts " Ruby で"
STDOUT.puts "標準出力"

file.close