#! /usr/bin/ruby
require "socket"

# エントリーポイント
def main
  socket = TCPSocket.open "localhost", 80

  socket.puts "EXIST ABC 001"
  socket.puts ""

  while line = socket.gets&.chomp
    puts line
    break if line.empty?
  end
  socket.close
end

main
