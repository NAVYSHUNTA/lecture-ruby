#! /usr/local/bin/ruby

require "socket"

# socket = TCPSocket.open("www.is.kyusan-u.ac.jp", 80)
# # socket.print("GET / \r\n") # CRLF
# # socket.print("GET / HTTP/1.0\r\n\r\n") # CRLF
# # socket.print("GET /~toshi/ HTTP/1.0\r\n\r\n") # CRLF
# socket.print("GET /~toshi/ HTTP/1.1\r\nHost: kyusan-u.ac.jp\r\n\r\n") # CRLF

# while line = socket.gets&.chomp
#   pp line
# end

# 次のように使い方ができるようにしよう
# ./client1.rb host path
# ./client1.rb www.is.kyusan-u.ac.jp /~toshi/
# host, path = ARGV
host = ARGV[0]
path = ARGV[1]

# socket = TCPSocket.open(host, "http") # code /etc/services
socket = TCPSocket.open(host, 80)
socket.print("GET #{path} HTTP/1.1\r\nHost: #{host}\r\n\r\n")
# socket.print("GET #{path} HTTP/1.1\r\nHost: #{host}\r\nConnection: close\r\n\r\n")

while line = socket.gets&.chomp
  pp line
end
