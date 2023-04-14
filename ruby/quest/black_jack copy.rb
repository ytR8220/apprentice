# ブラックジャックゲームを作る

# カードを引くモジュール
module Drow
  def drow
    drow_card = @deck.pop
    p drow_card
  end
end

# パーティークラス
class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end

  # カードの点数変換
  def point
  end
end

# プレイヤークラス
class Player < Person
  attr_reader :total
  @total = 0
  def turn
    include Drow
  end
end

# カード
class Card
  attr_reader :deck
  # デッキを構成
  def create
    @deck = []
    4.times do 1.upto(13){|n| @deck << n} end
    @deck.shuffle
  end
end

# ゲームクラス
class Game
  def initialize(member)
    @member = member
  end
end



def play
end

# インスタンスの作成
# デッキの作成
@deck = Card.new

# プレイヤー
@player = []
def player_set
  player_num = @player.size
  player_num.times do |n| @n = Player.new(@player[n]) end
end

# ディーラー

# ゲーム（基本ルール）

# ゲーム（ルール追加）

# 実行
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

@n.turn

# 参加者の登録
player_set

# 参加人数セット
game = Game.new(member)

# 山札の作成
@deck.create


# プレイヤーとディーラーがカードを2枚引く

# プレイヤーのターン

# ディーラーのターン

# 勝負
puts 'ブラックジャックを終了します。'