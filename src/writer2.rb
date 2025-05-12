PATH = "sample2.txt"

File.open PATH, "a" do |file|
  file.puts "Hello"
  file.puts ""
  file.write "書いたよ"
  file.puts " Ruby で"
  STDOUT.puts "標準出力"
end
