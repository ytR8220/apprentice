# ブロックを使った配列の処理
# each
array = ['上田', '田仲', '堀田']

def print_names(array)
  array.each.with_index(1) {
    |name, i|
    puts "#{i}. #{name}"
  }
end

print_names(array)