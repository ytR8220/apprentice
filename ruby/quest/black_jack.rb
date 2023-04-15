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
# ディーラーが引いたカードを公開
module Open
  def open(drow_card)
    puts "ディーラーの引いたカードは#{drow_card}です。"
    puts "ディーラーの引いた2枚目のカードはわかりません。"
  end
end

# 引いたカードを確認するモジュール
module Check
  def check(name, drow_card)
    puts "#{name}が引いたカードは#{drow_card}です。"
  end
end

# カードを1枚引いて公開するモジュール
module DrowOpen
  include Check
  def drow_open(name, deck, hand)
    drow_card = deck.pop
    check(name, drow_card)
    hand << drow_card
  end
end

# カードを1枚引くだけのモジュール
module Drow
  def drow(name, deck, hand)
    drow_card = deck.pop
    hand << drow_card
  end
end

# 引いたカードの合計を求めるモジュール
module Sum
  def sum(total, hand)
    total = 0
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
    print "あなたの現在の得点は#{sum}です、カードを引きますか？ (y/n)"
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
  include DrowOpen
  include Drow
  include Sum
end

# c-dealer
class Dealer < Person
  include DrowOpen
  include Drow
  include Open
  include Sum
end

# c-game
class Game
  include Question

  # ゲームスタート
  def start(player, dealer, deck)

    # あなたがカードを2枚引く
    2.times do player[0].drow_open(player[0].name, deck, player[0].hand) end
    player[0].sum(player[0].total, player[0].hand)

    # 他のプレイヤーがカードを2枚引く
    (player.size - 1).times do |n|
      n += 1 
      2.times do player[n].drow(player[n].name, deck, player[n].hand) end
      player[n].sum(player[n].total, player[n].hand)
    end

    # ディーラーがカードを2枚引く
    2.times do |n|
      dealer.drow('ディーラー', deck, dealer.hand)
      if n == 0
        dealer.open(dealer.hand[0])
      end
    end
    
    # プレイヤーのターン
    player.size.times do |n|
      puts "#{player[n].name}のターンです。"
      if n == 0
        while player[n].total < 21 && question(player[n].total)
          player[n].drow_open(player[n].name, deck, player[n].hand)
          player[n].sum(player[n].total, player[n].hand)
        end
        puts "#{player[n].name}の得点は#{player[n].total}です。"
      else
        while player[n].total < 21
          player[n].drow_open(player[n].name, deck, player[n].hand)
          player[n].sum(player[n].total, player[n].hand)
        end
        puts "#{player[n].name}の得点は#{player[n].total}です。"
      end
    end
    
    # ディーラーのターン
    puts "ディーラーのターンです。"
    # ディーラーの2枚目のカードをオープン
    puts "ディーラーの引いた2枚目のカードは#{dealer.hand[1]}でした。"
    dealer_sum = dealer.sum(dealer.total, dealer.hand)
    puts "ディーラーの現在の得点は#{dealer_sum}です。"
    # ディーラーが17以上になるまでカードを引く
    while dealer_sum < 17
      dealer.drow_open(dealer.name, deck, dealer.hand)
      dealer_sum = dealer.sum(dealer.total, dealer.hand)
    end

    # 勝負(得点が21に近い人が勝ち)
    data = {}
    player.size.times do |n|
      puts "#{player[n].name}の得点は#{player[n].total}です。"
      if player[n].total <= 21
        data["#{player[n].name}"] = player[n].total - 21
      end
    end
    puts "#{dealer.name}の得点は#{dealer.total}です。"
    if dealer.total <= 21
      data["#{dealer.name}"] = dealer.total - 21
    end

    score = data.values
    winner_score = score.min_by do |n| (n - 0).abs end
    if winner_score.nil?
      puts "今回勝者はいません。"
    else
      winner = data.key(winner_score)
      puts "#{winner}の勝ちです！"
    end
  end

end


#############################################################################################
@player = []
# ゲームの開始
puts 'プレイヤーの人数を教えて下さい。'
puts '1.1人'
puts '2.2人'
puts '3.3人'
member = gets.chomp.to_i
member.times {
  |n| num = n + 1
  puts "#{num}人目の名前を教えて下さい。"
  name = gets.chomp
  !name.empty? ? @player << name : @player << 'あなた'
}

# ゲーム準備
@preparation = Preparation.new(@player)
@preparation.player_set
@player_list = @preparation.player_list
@dealer = Dealer.new('ディーラー')
@deck = @preparation.deck_set

# ゲームスタート
puts 'ブラックジャックを開始します。'
game = Game.new
game.start(@player_list, @dealer, @deck)

# ゲーム終了
puts 'ブラックジャックを終了します。'