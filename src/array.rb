a = [10, 20, 50, 30]
# Java の場合
# int[] a = {10, 20, 50, 30}

# a の要素を全て表示
# Java の場合
# for (int i = 0; i < a.length; i++) {
#   System.out.println(a[i]);
# }

pp a

# 別のやり方
p a

# 別のやり方
a.each do |ele|
  print "#{ele} "
end
puts

# 別のやり方
idx = 0
while idx < a.length
  print "#{a[idx]} "
  idx += 1
end
puts

# a の最初の要素が偶数だったら a から取り除く
# a の全ての要素を表示
a.shift if a.first.even?
pp a
