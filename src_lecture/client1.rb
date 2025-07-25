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

# URL を引数に与えたい。URL は次の形式であるとする。
# http://ホスト名/パス名/
# ./client1.rb http://www.is.kyusan-u.ac.jp/~toshi/
url = ARGV[0]

url_remove_http = url.gsub("http://", "")
# url_remove_http = url[7..] # こちらでもよい

host, path = url_remove_http.split "/"
path = "/#{path}/"

# socket = TCPSocket.open(host, "http") # code /etc/services
socket = TCPSocket.open(host, 80)
socket.print("GET #{path} HTTP/1.1\r\nHost: #{host}\r\n\r\n")
# socket.print("GET #{path} HTTP/1.1\r\nHost: #{host}\r\nConnection: close\r\n\r\n")

# ヘッダー情報を表示しないように改良
is_find_empty_line = false # 空行が見つかるまでの行は false
while line = socket.gets&.chomp
  puts line if is_find_empty_line
  is_find_empty_line ||= line.empty?
end
