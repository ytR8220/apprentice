#  XOR
# xとyに0か1をランダムで代入
x = rand(0..1)
y = rand(0..1)

# 引数のboolean型をそのまま代入
def bool(a)
  if a
    a = true
  else
    a = false
  end
end

# ｘとyにtrueかfalseを代入する
bool(x)
bool(y)

# xとyどちらかがtureならtureを、どちらもtureまたはfalseならfalseを返す
def xor(x, y)
  # puts x
  # puts y
  if x == y
    puts false
  else
    puts true
  end
end

# xor(x, y)
xor(true, true)
xor(true, false)
xor(false, true)
xor(false, false)
