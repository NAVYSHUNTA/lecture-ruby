#! /usr/bin/ruby
require "socket"

# 当該ソケットに対する処理
def server socket
  while line = socket.gets&.chomp
    puts line
    socket.puts line
  end
  socket.close
end

# エントリーポイント
def main
  tcp_server = TCPServer.open 80
  while socket = tcp_server.accept
    # マルチスレッド
    Thread.new do
      server socket
    end
  end
  tcp_server.close
end

main
