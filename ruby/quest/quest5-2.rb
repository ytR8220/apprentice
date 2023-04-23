#  電車の料金
age = nil
print '年齢を教えて下さい=>'
loop do
  input = gets.chomp
  if input =~ /^[+-]?[0-9]+$/
    age = input.to_i
    break
  else
    print '整数で入力してください=>'
  end
end

# age = rand(150)

def train_fare(age)
  if age >= 12
    puts "年齢は#{age}歳ですね"
    print "料金は200円です"
  elsif age >= 6
    puts "年齢は#{age}歳ですね"
    print "料金は100円です"
  else
    puts "年齢は#{age}歳ですね"
    print "料金は無料です"
  end
end

train_fare(age)
