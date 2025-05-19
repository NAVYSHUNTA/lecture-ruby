# コマンドラインで指定したファイルの各行を 1 行ずつ画面に表示
PATH = ARGV[0]

File.open PATH, "r" do |file|
  while line = file.gets&.chomp
    puts line
  end
end