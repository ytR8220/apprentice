# ブラックジャックゲームを作る

# m-drow
module Drow
  def drow
    drow_card = @deck.pop
    p drow_card
  end
end

# c-person
class Person
  attr_reader :name, :total
  def initialize(name)
    @name = name
    @total = 0
  end
end

# c-player
class Player < Person
  # def turn
  #   include Drow
  # end
end

# c-dealer
class Dealer < Person
  def turn
    include Drow
  end
end

# c-card
class Card
  attr_reader :deck
  # デッキを構成
  def create
    @deck = []
    4.times do 1.upto(13){|n| @deck << n} end
    @deck.shuffle
  end
end

# c-game
class Game
  def initialize(member)
    @member = member
  end
end







# ディーラー

# ゲーム（基本ルール）

# ゲーム（ルール追加）

#############################################################################################
@player = []
# ゲームの開始
puts 'ブラックジャックを開始します。'
puts 'プレイヤーの人数を教えて下さい。'
puts '1.1人'
puts '2.2人'
puts '3.3人'
puts '4.4人'
member = gets.chomp.to_i
member.times {
  |n| num = n + 1
  puts "#{num}人目の名前を教えて下さい。"
  @player << gets.chomp
}

# 参加人数セット
game = Game.new(member)

# 参加者の登録
def player_set
  player_num = @player.size
  player_num.times do |n| instance_variable_set('@player_' + (n + 1).to_s, Player.new(@player[n])) end
end
player_set
puts @player_1.name

# 山札の作成
@deck = Card.new
@deck.create

# プレイヤーとディーラーがカードを2枚引く


# プレイヤーのターン


# ディーラーのターン


# 勝負


puts 'ブラックジャックを終了します。'