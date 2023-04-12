# ハッシュ
# 首都

def print_capitals(array)
  array.each do |key, value|
    puts "#{key}の首都は#{value}です"
  end
end

print_capitals({ '日本' => '東京', 'アメリカ' => 'ワシントンD.C.' })