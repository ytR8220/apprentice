# ブロックを使った配列の処理
# map

def square(numbers)
  numbers.map {
    |n| n * n 
  }
end


squared_numbers = square([5, 7, 10])
print squared_numbers