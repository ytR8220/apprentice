# 三角形の面積を求める
x = nil
y = nil

# 高さの入力を求める
# 入力された値が整数でなければもう一度入力を求める
loop do
  print '高さを教えて下さい=>'
  input = gets.chomp
  if input =~ /^[0-9]+$/
    y = input.to_i
    break
  else
    print '入力された値が整数ではありません。もう一度入力してください=>'
  end
end

# 幅の入力を求める
# 入力された値が整数でなければもう一度入力を求める
loop do
  print '幅を教えて下さい=>'
  input = gets.chomp
  if input =~ /^[0-9]+$/
    x = input.to_i
    break
  else
    print '入力された値が整数ではありません。もう一度入力してください=>'
  end
end

# 面積を出力する関数
def area(x, y)
  result = x * y / 2
  print "三角形の面積は#{result}です"
end

area(x, y)
