# 行頭に行番号を表示
# PATH = "sample2.txt"
# PATH = "reader2.rb"
PATH = ARGV[0] # コマンドライン引数

File.open PATH, "r" do |file|
  line_number = 0
  while line = file.gets&.chomp
    line_number += 1
    puts "#{line_number}: #{line}"
    # puts line_number.to_s + ": " + line
  end
end
