#! /usr/bin/ruby
require "socket"

# エントリーポイント
def main
  socket = TCPSocket.open "localhost", 80

  loop do
    client_message = gets&.chomp
    break if ["exit", ""].include? client_message

    puts "send: #{client_message}"
    socket.puts client_message
    while line = socket.gets&.chomp
      puts line
      break if line.empty?
    end
  end
  puts "exit client"
  socket.close
end

main
