# 繰り返し処理
# 総和2

def sum(x, y)
  i = 0
  x.upto(y) {
    |n| i += n
  }
  i
end

puts sum(10, 80)