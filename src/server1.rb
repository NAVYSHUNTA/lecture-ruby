#! /usr/bin/ruby
require "socket"

# 参考にしたサイト
# https://www.geekpage.jp/programming/ruby-network/tcp-1.php

def server socket
  while buf = socket.gets
    p buf
  end
  socket.close
end

# ポート番号 80 番で open
s0 = TCPServer.open(80)
socket = s0.accept
server socket
s0.close
