#! /usr/bin/ruby
require "socket"
require "net/http" # URL が存在するかどうかの判定のために使用（ライブラリの使用目的）

# グローバル変数
HTTP_200_OK_CODE = "200" # マジックナンバーを避けるため
CONTEST_NAME = ["ABC", "ARC", "AGC"]

# 指定した URL が存在するかどうか
def url_exist? url
  uri = URI.parse url
  result = Net::HTTP.get_response uri
  result.code == HTTP_200_OK_CODE
end

# ATCODER プロトコルの各メソッドに対する処理
def handle_atcoder_method line
  method, contest_name, contest_number = line.split

  contest_name_upcase = contest_name.upcase
  contest_name_downcase = contest_name.downcase

  return "コンテスト名が適切ではありません" unless CONTEST_NAME.include? contest_name_upcase
  return "コンテスト番号が整数ではありません" unless contest_number =~ /^[0-9]+$/
  return "コンテスト番号が 3 桁以下の正整数で指定されていません" if contest_number.length > 3 || contest_number.to_i <= 0

  contest_number_three_digits = format "%03d", contest_number
  url = "https://atcoder.jp/contests/#{contest_name_downcase}#{contest_number_three_digits}/"

  case method
  when "EXIST"
    sleep 1 # 短時間で頻繁にサーバへアクセスしないようにするため
    contest = "#{contest_name_upcase}#{contest_number_three_digits}"
    if url_exist? url
      "#{contest} exists."
    else
      "#{contest} does not exist."
    end

  when "URL"
    url

  else
    "メソッド名が適切ではありません"
  end
end

# 当該ソケットに対する処理
def server socket
  until (line = socket.gets&.chomp).empty?
    puts "log: #{line}"
    result = handle_atcoder_method line
    socket.puts result
    socket.puts ""
  end
  socket.close
end

# エントリーポイント
def main
  tcp_server = TCPServer.open 80
  while socket = tcp_server.accept
    # マルチスレッド
    Thread.new do
      server socket
    end
  end
  tcp_server.close
end

main
