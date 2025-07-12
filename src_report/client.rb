#! /usr/bin/ruby
require "socket"

# エントリーポイント
def main
  socket = TCPSocket.open "localhost", 80
  socket.puts "Hello, Server!\r\nHave a nice day!\r\n\r\n"
  while line = socket.gets&.chomp
    puts line
    break if line.empty?
  end
  socket.close
end

main
