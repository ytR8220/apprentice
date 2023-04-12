# 繰り返し処理
# 羊

print '羊を何匹数えますか？ =>'
num = gets.chomp

def sheep(n)
  1.upto(n) {|i| sleep(1)
  puts "羊が#{i}匹"}
  sleep(1)
  puts "おやすみなさい"
end

sheep(num.to_i)