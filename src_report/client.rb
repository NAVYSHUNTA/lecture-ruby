#! /usr/bin/ruby
require "socket"

# エントリーポイント
def main
  socket = TCPSocket.open "localhost", 80

  socket.puts "Hello, Server!"
  socket.puts "Have a nice day!"
  socket.puts ""

  while line = socket.gets&.chomp
    puts line
    break if line.empty?
  end
  socket.close
end

main
