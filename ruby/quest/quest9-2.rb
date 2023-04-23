# シンボル
# 両替

puts 'いまお持ちの通貨はなんですか？ =>'
puts '1.アメリカドル'
puts '2.日本円'
puts '3.ユーロ'
sorce = gets.chomp
puts 'いくらお持ちですか？ =>'
amount = gets.chomp.to_i
puts 'なんの通貨に替えますか？ =>'
puts '1.アメリカドル'
puts '2.日本円'
puts '3.ユーロ'
target = gets.chomp

conversion_rates = {
  usd: 1.0,
  jpy: 110.0,
  eur: 0.8,
}

def convert_currency(amount, sorce_currency, target_currency, conversion_rates)
  sorce_currency == :usd ? amount * conversion_rates[target_currency] : amount / conversion_rates[sorce_currency]
end

case sorce
when "1"
  sorce = :usd
when "2"
  sorce = :jpy
when "3"
  sorce = :eur
end

case target
when "1"
  target = :usd
when "2"
  target = :jpy
when "3"
  target = :eur
end

result = convert_currency(amount, sorce, target, conversion_rates)
print "お渡しする金額は#{result}です"