# 例外
# 電卓

def calc(num1, num2, operator)
  case operator
  when '+'
  when '-'
  when '*'
  when '/'
  else
    raise '+, -, *, / のいずれかを使用してください'
  end
  num1.integer? ? (num1 = num1) : (raise 'num1、num2は整数で入力してください')
  num2.integer? ? (num2 = num2) : (raise 'num1、num2は整数で入力してください')

  num1.send("#{operator}", num2)
  
end


# puts '1つ目の数字を入力してください:'
# num1 = gets.chomp.to_i
# puts '2つ目の数字を入力してください:'
# num2 = gets.chomp.to_i
# puts '演算子（+, -, *, /）を入力してください。'
# operator = gets.chomp

begin
  # result = calc(num1, num2, operator)
  result = calc(1, 0, '/')
  result = calc(1.5, 2, '+')
  result = calc(1.5, 2, '**')
  result = calc(5, 2, '*')
  puts result
rescue ZeroDivisionError
  puts 'ゼロによる割り算は許可されていません'
  rescue => e
    puts e
end
