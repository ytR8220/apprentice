# 例外
# 電卓

def calc(num1, num2, operator)
  
  begin
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

    result = num1.send("#{operator}", num2)
    puts result
  rescue ZeroDivisionError
  puts 'ゼロによる割り算は許可されていません'
  rescue => e
    puts e
  end
  
end



  calc(1, 0, '/')
  calc(1.5, 2, '+')
  calc(1.5, 2, '**')
  calc(5, 2, '*')