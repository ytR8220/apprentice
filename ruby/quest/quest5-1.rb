# 入力された2つの値の大小を比較する
x = nil
y = nil
print '1つ目の数値を入力してください=>'
loop do
  input = gets.chomp
  if input =~ /^[+-]?[0-9]+$/
    x = input.to_i
    break
  else
    print '整数で入力してください=>'
  end
end

print '2つ目の数値を入力してください=>'
loop do
  input = gets.chomp
  if input =~ /^[+-]?[0-9]+$/
    y = input.to_i
    break
  else
    print '整数で入力してください=>'
  end
end

def greater(x, y)
  if x > y
    print 'x > y'
  elsif x < y
    print 'x < y'
  else
    print 'x == y'
  end
end

greater(x, y)
