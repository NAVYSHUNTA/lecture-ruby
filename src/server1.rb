#! /usr/bin/ruby
require "socket"

# 参考にしたサイト
# https://www.geekpage.jp/programming/ruby-network/tcp-1.php

def server socket
  while buf = socket.gets
    p buf
    socket.puts "reply: #{buf}"
  end
  socket.close
end

# ポート番号 80 番で open
s0 = TCPServer.open(80)

while socket = s0.accept
  Thread.new do
    server socket
  end
end
s0.close
