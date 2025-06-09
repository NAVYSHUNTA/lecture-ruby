#! /url/bin/ruby

url = ARGV[0]
url2 = url[7..]
idx = url2.index "/"
host = url2[...idx]
path = url2[idx..]
puts "host: #{host}"
puts "path: #{path}"
