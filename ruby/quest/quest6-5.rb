# 繰り返し処理
# フィボナッチ数列

def fibonacci(n)
  n > 0 ? n > 1 ? fibonacci(n - 1) + fibonacci(n - 2) : 1 : 0
end

puts fibonacci(0)
puts fibonacci(1)
puts fibonacci(2)
puts fibonacci(3)
puts fibonacci(4)
puts fibonacci(7)
puts fibonacci(30)