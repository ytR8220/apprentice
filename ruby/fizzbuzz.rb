# fizzbuzzプログラムの作成
def fizz_buzz(num)
  if num % 15 == 0
    'FIzz Buzz'
  elsif num % 5 == 0
    'Buzz'
  elsif num % 3 == 0
    'Fizz'
  else
    num.to_s
  end
end

fizz_buzz(1)
fizz_buzz(2)
fizz_buzz(3)
fizz_buzz(4)
fizz_buzz(5)
fizz_buzz(6)
fizz_buzz(15)