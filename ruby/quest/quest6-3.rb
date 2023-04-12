# 繰り返し処理
# 総和1

def sum_1_10(n)
  n > 1 ? n + sum_1_10(n - 1) : 1
end

puts sum_1_10(100)