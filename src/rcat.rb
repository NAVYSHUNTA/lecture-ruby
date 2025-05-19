# コマンドラインで指定した全てのファイルの各行を 1 行ずつ画面に表示
# ruby rcat.rb a.txt b.txt c.rb
ARGV.each do |path|
  File.open path, "r" do |file|
    while line = file.gets&.chomp
      puts line
    end
  end
end
