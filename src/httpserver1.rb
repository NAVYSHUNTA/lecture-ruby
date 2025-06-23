#! /usr/bin/ruby
require "socket"

# echo server
# 1. TCP のポート 80 で接続を待ち受ける
# 2. while の繰り返しで、行を読み込む
#  2.1 読み込んだ行をソケットに送り返す

s0 = TCPServer.open(80)

while socket = s0.accept
  Thread.new do
    while line = socket.gets&.chomp
      puts line
      socket.puts line
      break if line.empty?
    end
    socket.close
    sleep 5
  end
end
s0.close
