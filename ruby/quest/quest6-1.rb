# 繰り返し処理
# あいさつ

# times
# def hello(i)
#   100.times{
#     |n| n += i
#   puts "#{n}回目のこんにちは！"
#   }
# end

# upto
# def hello(i)
#   i.upto(100) {
#     |n|
#     puts "#{n}回目のこんにちは!"
#   }
# end

# step
def hello(i)
  i.step(100, 1) {
    |n| puts "#{n}回目のこんにちは！"
  }
end
  
# while
# def hello(i)
#   n = i
#   while n <= 100
#     puts "#{n}回目のこんにちは!"
#     n += 1
#   end
# end

# until
# def hello(i)
#   n = i
#   until n > 100
#     puts "#{n}回目のこんにちは!"
#     n += 1
#   end
# end

# for
# def hello(i)
#   for n in 1..100
#     puts "#{n}回目のこんにちは！"
#   end
# end

# loop
# def hello(i)
#   n = i
#   loop do
#     if n <= 100
#       puts "#{n}回目のこんにちは！"
#       n += 1
#     else
#       break
#     end
#   end
# end

# 再帰呼び出し
# def hello(i)
#   i > 0 ? i * hello(i - 1) : 1
# end

hello(1)