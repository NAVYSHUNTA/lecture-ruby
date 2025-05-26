#! /usr/local/bin/ruby

require "socket"

socket = TCPSocket.open("www.is.kyusan-u.ac.jp", 80)
# socket.print("GET / \r\n") # CRLF
socket.print("GET / HTTP/1.0\r\n\r\n") # CRLF

while line = socket.gets&.chomp
  pp line
end
