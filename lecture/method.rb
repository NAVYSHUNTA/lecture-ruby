def max a, b
  a > b ? a : b
  # if a > b
  #   a
  # else
  #   b
  # end
end

a = 5
b = 10
c = max(a, b)
puts c

# 整数を一つ受け取って、
# 偶数なら "even"
# 奇数なら "odd"
# という文字列を返す
# evenOdd というメソッドを宣言
# 
# 引数 5 で evenOdd を呼び出して、その返り値を表示
# 引数 100 で evenOdd を呼び出して、その返り値を表示
def evenOdd n
  n % 2 == 0 ? "even" : "odd"
end

puts evenOdd(5)
puts evenOdd(100)

# こっちでも良い
puts evenOdd 5
puts evenOdd 100
