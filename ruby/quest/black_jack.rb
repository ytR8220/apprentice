# ブラックジャックゲームを作る
require 'debug'

# カードクラス
class Card
  attr_reader :deck
  @deck = []
  # 山札を構成
  def create
    @deck = []
    mark = ['スペード', 'ダイヤ', 'ハート', 'クラブ']
    mark.size.times do |i|
      @deck << "#{mark[i]}のA"
      2.upto(10) do |n| @deck << "#{mark[i]}の#{n}" end
      @deck << "#{mark[i]}のJ"
      @deck << "#{mark[i]}のQ"
      @deck << "#{mark[i]}のK"
    end
    # 山札をシャッフル
    @deck = @deck.shuffle
  end
  
end

# ゲーム準備クラス
class Preparation
  attr_reader :player_list, :deck

  # 参加人数ーの確定
  def initialize(member)
    @member = member
    @player_list = []
  end

  # 参加者の登録
  def player_set
    player_num = @member.size
    player_num.times do |n| @player_list << instance_variable_set('@player_' + (n + 1).to_s, Player.new(@member[n])) end
  end

  # 山札の作成
  def deck_set
    @deck = Card.new
    @deck.create
  end
end

################################################################################
# m-open
# module Open
#   def open(drow_card, name)
#     puts "#{name}さんの引いたカードは#{drow_card}です"
#   end
# end

# 引いたカードを確認するモジュール
module Check
  def check(drow_card)
    puts "あなたが引いたカードは#{drow_card}です"
  end
end

# カードを1枚引くモジュール
module Drow
  def drow(deck, hand)
    drow_card = deck.pop
    hand << drow_card
  end
end

# 引いたカードの合計を求めるモジュール
module Sum
  def sum(total, hand)
    hand.each do |n|
      n = n.split('の')[1]
      case n
      when 'J'
        n = "10"
      when 'Q'
        n = "10"
      when 'K'
        n = "10"
      when 'A'
        n = '1'
      end
      total += n.to_i
    end
    @total = total
  end
end

# まだカードを引くか質問するモジュール
module Question
  def question(sum)
    print "あなたの現在の得点は#{sum}です、カードを引きますか？ [y/n]"
    response = gets
    case response
    when /^[yY]/
      return true
    when /^[nN]/
      return false
    end
  end
end

# 人クラス
class Person
  attr_reader :name, :total, :hand
  def initialize(name)
    @name = name
    @total = 0
    @hand = []
  end

end

# c-player
class Player < Person
  include Drow
  include Sum
end

# c-dealer
class Dealer < Person
end

# c-game
class Game
  include Question

  # ゲームスタート
  def start(player, deck)
    # プレイヤーがカードを2枚引く
    player.size.times do |n| 
      2.times do player[n].drow(deck, player[n].hand) end
      player[n].sum(player[n].total, player[n].hand)
    end
    
    # プレイヤーのターン
    player.size.times do |n|
      puts "#{player[n].name}のターンです。"
    while question(player[n].total)
      player[n].drow(deck, player[n].hand)
      player[n].sum(player[n].total, player[n].hand)
    end
  end

  # ディーラーのターン
  # ディーラーの2枚目のカードをオープン
  # ディーラーが17以上になるまでカードを引く

  # 勝負

  end

end


#############################################################################################
@player = []
# ゲームの開始
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

# ゲーム準備
@preparation = Preparation.new(@player)
@preparation.player_set
@player_list = @preparation.player_list
@deck = @preparation.deck_set

# ゲームスタート
puts 'ブラックジャックを開始します。'
game = Game.new
game.start(@player_list, @deck)

# ゲーム終了
puts 'ブラックジャックを終了します。'