# 改札機の機能

# シナリオ1
# 160円の切符を購入する。
# 梅田で入場し、十三で出場する。
# 期待する結果：出場できる。

# シナリオ2
# 160円の切符を購入する。
# 梅田で入場し、三国で出場する。
# 期待する結果：出場できない。

# シナリオ3
# 190円の切符を購入する
# 梅田で入場し、三国で出場する。
# 期待する結果：出場できる。

# シナリオ4
# 160円の切符を購入する。
# 十三で入場し、三国で出場する。
# 期待する結果：出場できる。

# 以上、チェリー本より ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

# 160円 true => 梅田から十三間、十三から三国間
# 190円 true => 全区間

require "tty-prompt"
prompt = TTY::Prompt.new

class Gate

  def pay(num)
    @pay = num
  end

  def exit(price)
    price.price <= @pay ? '出場できる' : '出場できない'
  end
end

# 入場場所と出場場所に応じて金額を決めるクラス
class Price
  attr_reader(:price)
  def initialize(from, to)
    if from == '梅田' && to == '三国'
      @price = 190
    else
      @price = 160
    end
  end
end

ticket = prompt.select("いくらの切符を購入しますか？", %w(160 190)).to_i
enter = prompt.select("どこで乗りますか", %w(梅田 十三 三国))
exit = prompt.select("どこで降りますか？", %w(梅田 十三 三国))


# 実行
gate = Gate.new
price = Price.new(enter, exit)
gate.pay(ticket)
puts gate.exit(price)
