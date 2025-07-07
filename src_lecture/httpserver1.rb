#! /usr/bin/ruby
require "socket"

# 前回
# echo server
# 1. TCP のポート 80 で接続を待ち受ける
# 2. while の繰り返しで、行を読み込む
#  2.1 読み込んだ行をソケットに送り返す

# 今回
# 簡易的な Web サーバを実装しよう

s0 = TCPServer.open(80)

while socket = s0.accept
  Thread.new do
    line = socket.gets&.chomp
    _method, path, httpver = line&.split

    case path
    when "/93"
      socket.puts "#{httpver} 301 Moved Permanently"
      socket.puts "Location: https://www.kyusan-u.ac.jp/"
      socket.puts
      socket.puts ""

    when "/hello"
      socket.puts "#{httpver} 200 OK"
      socket.puts
      socket.puts "Hello, World!"

    else
      file_path = ".#{path}"
      if File.exist? file_path
        socket.puts "#{httpver} 200 OK"
        socket.puts "Content-Type: text/plain; charset=UTF-8"
        socket.puts
        File.open file_path, "r" do |file|
          while data = file.gets&.chomp
            socket.puts data
          end
        end

      else
        socket.puts "#{httpver} 404 Not Found"
        socket.puts
      end
    end

    socket.close
  end
end
s0.close
