# ユーザーに好きな数字を尋ねる
print "好きな数値を入力してください："
input = gets.chomp.to_i

# 入力された数字を2倍して返す
result = input * 2
puts "2倍の数値です：#{result}"