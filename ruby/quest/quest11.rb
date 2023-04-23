# frozen_string_literal: true

# オブジェクト指向を使う
# クラスの定義
# class VendingMachine
#   def press_button
#     "cider"
#   end
# end

# vending_machine = VendingMachine.new
# puts vending_machine.press_button

###########################################################
# initializeメソッド
# class VendingMachine
#   def initialize(name)
#     @name = name
#   end
#   def press_manufacturer_name
#     @name
#   end
# end

# vending_machine = VendingMachine.new('サントリー')
# puts vending_machine.press_manufacturer_name

###########################################################
# メソッドの可視性
# class VendingMachine

#   def deposit_coin(coin)
#     coin == 100 ? @deposit += coin : ""
#   end

#   def press_button
#     if @deposit >= 100
#       @deposit -= 100
#       'cider'
#     end
#   end

#   private
#   def initialize(name)
#     @name = name
#     @deposit = 0
#   end

#   def press_manufacturer_name
#     @name
#   end

# end

# vending_machine = VendingMachine.new('サントリー')
# puts vending_machine.press_button

# vending_machine.deposit_coin(150)
# puts vending_machine.press_button

# vending_machine.deposit_coin(100)
# puts vending_machine.press_button

# puts vending_machine.press_manufacturer_name

###########################################################
# 単一責任の原則
# class VendingMachine
#   def deposit_coin(coin)
#     @deposit += coin
#   end

#   def press_button(item)
#     item.item == 'cola' ? @price = 150 : @price = 100
#     if @deposit >= @price
#       @deposit -= @price
#       item.buy
#     end
#   end

#   private
#   def initialize(name)
#     @name = name
#     @deposit = 0
#   end
# end

# class Drink
#   attr_accessor :item
#   def initialize(item)
#     @item = item
#   end

#   def buy
#     @item
#   end
# end

# cola = Drink.new('cola')
# vending_machine = VendingMachine.new('サントリー')
# vending_machine.deposit_coin(100)
# puts vending_machine.press_button(cola)
# vending_machine.deposit_coin(100)
# puts vending_machine.press_button(cola)
# puts vending_machine.press_button(cola)

###########################################################
# 継承
# class VendingMachine

#   def deposit_coin(coin)
#     @deposit += coin
#   end

#   def press_button(item)
#     if item.item == 'hot' && @deposit >= 100 && @cup > 0
#       @cup -= 1
#       @deposit -= 100
#       item.buy
#     elsif item.item != 'hot' && @deposit >= 100
#       @deposit -= 100
#       item.buy
#     end
#   end

#   def add_cup(num)
#     @cup += num
#   end

#   private
#   def initialize(name)
#     @name = name
#     @deposit = 0
#     @cup = 0
#   end
# end

# class Coffee < Drink
#   def buy
#     @item == 'hot' ? 'hot cup coffee' : 'ice coffee'
#   end
# end

# hot_cup_coffee = Coffee.new('hot');
# cider = Drink.new('cider')
# vending_machine = VendingMachine.new('サントリー')
# vending_machine.deposit_coin(100)
# vending_machine.deposit_coin(100)
# puts vending_machine.press_button(cider)

# puts vending_machine.press_button(hot_cup_coffee)
# vending_machine.add_cup(1)
# puts vending_machine.press_button(hot_cup_coffee)

###########################################################
# ポリモーフィズムとまとめ

# 自動販売機クラス
class VendingMachine
  # コインの投入
  def deposit_coin(coin)
    @deposit += coin
  end

  # カップの追加
  def add_cup(num)
    @cup += num
  end

  # 商品を選ぶ
  def press_button(item)
    # defined?(item.cup) ? 0 < @cup && item.price <= @deposit ? (@cup -= 1; @deposit -= item.price; item.buy) : "" :
    # item.price <= @deposit ? (@deposit -= item.price; item.buy) : ""
    if defined?(item.cup)
      if @cup.positive? && @deposit >= item.price
        @cup -= 1
        @deposit -= item.price
        item.buy
      end
    elsif @deposit >= item.price
      @deposit -= item.price
      item.buy
    end
  end

  private

  def initialize(name)
    @name = name
    @deposit = 0
    @cup = 0
  end
end

# 商品クラス
class Product
  attr_reader :item, :price

  def initialize(item)
    @item = item
    @price = 150
  end

  def buy
    "#{@item}が出てきました"
  end
end

# コールドドリンククラス
class Cold < Product
  def initialize(item)
    super(item)
    @price = 100
  end
end

# ホットドリンククラス
class Hot < Product
  attr_reader :cup

  def initialize(item)
    super(item)
    @cup = true
  end
end

# スナック菓子クラス
class Snack < Product
  def initialize(item)
    super(item)
    @price = 130
  end
end

cold_drink = Cold.new('cola')
hot_drink = Hot.new('tea')
snack = Snack.new('choco')
vending_machine = VendingMachine.new('サントリー')

vending_machine.deposit_coin(400)
puts vending_machine.press_button(cold_drink)
puts vending_machine.press_button(snack)
vending_machine.add_cup(1)
puts vending_machine.press_button(hot_drink)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(hot_drink)
