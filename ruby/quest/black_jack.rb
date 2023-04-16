# frozen_string_literal: true

# ブラックジャックゲームを作る

require 'debug'

# カードクラス
class Card
  attr_reader :deck

  @deck = []
  # 山札を構成
  def create
    @deck = []
    mark = %w[スペード ダイヤ ハート クラブ]
    mark.size.times do |i|
      @deck << "#{mark[i]}のA"
      2.upto(10) { |n| @deck << "#{mark[i]}の#{n}" }
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
    player_num.times do |n|
      player = '@player_'
      player_s = +player
      var = player_s.concat((n + 1).to_s)
      @player_list << instance_variable_set(var, Player.new(@member[n]))
    end
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
    puts 'ディーラーの引いた2枚目のカードはわかりません。'
  end
end

# 引いたカードを確認するモジュール
module Check
  def check(name, drow_card)
    puts "#{name}が引いたカードは#{drow_card}です。"
  end
end

# 引いたカードの合計を求めるモジュール
module Sum
  def sum(total, hand)
    n = hand[-1].split('の')[1]
    case n
    when 'A'
      n = total + 11 <= 21 ? '11' : '1'
    when /\A[0-9]+\z/
      n
    else
      n = '10'
    end
    @total = total + n.to_i
  end
end

# カードを1枚引いて公開するモジュール
module DrowOpen
  include Check
  include Sum
  def drow_open(name, deck, hand, total)
    drow_card = deck.pop
    check(name, drow_card)
    hand << drow_card
    sum(total, hand)
  end
end

# カードを1枚引くだけのモジュール
module Drow
  include Sum
  def drow(deck, hand, total)
    drow_card = deck.pop
    hand << drow_card
    sum(total, hand)
  end
end

# まだカードを引くか質問するモジュール
module Question
  def question(sum)
    print "あなたの現在の得点は#{sum}です、カードを引きますか？ (y/n)"
    response = gets
    case response
    when /^[yY]/
      true
    when /^[nN]/
      false
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
end

# c-dealer
class Dealer < Person
  include DrowOpen
  include Drow
  include Open
end

# c-game
class Game
  include Question

  # ゲームスタート
  def start(player, dealer, deck)
    # あなたがカードを2枚引く
    2.times { player[0].drow_open(player[0].name, deck, player[0].hand, player[0].total) }

    # 他のプレイヤーがカードを2枚引く
    (player.size - 1).times do |n|
      n += 1
      2.times { player[n].drow_open(player[n].name, deck, player[n].hand, player[n].total) }
    end

    # ディーラーがカードを2枚引く
    2.times do |n|
      dealer.drow(deck, dealer.hand, dealer.total)
      dealer.open(dealer.hand[0]) if n.zero?
    end

    # プレイヤーのターン
    player.size.times do |n|
      puts "#{player[n].name}のターンです。"
      if n.zero?
        while player[n].total < 21 && question(player[n].total)
          player[n].drow_open(player[n].name, deck, player[n].hand, player[n].total)
        end
      else
        player[n].drow_open(player[n].name, deck, player[n].hand, player[n].total) while player[n].total < 17
      end
      puts "#{player[n].name}の得点は#{player[n].total}です。"
    end

    # ディーラーのターン
    puts 'ディーラーのターンです。'
    # ディーラーの2枚目のカードをオープン
    puts "ディーラーの引いた2枚目のカードは#{dealer.hand[1]}でした。"
    puts "ディーラーの現在の得点は#{dealer.total}です。"
    # ディーラーが17以上になるまでカードを引く
    dealer.drow_open(dealer.name, deck, dealer.hand, dealer.total) while dealer.total < 17

    # 勝負(得点が21に近い人が勝ち)
    data = {}
    player.size.times do |n|
      puts "#{player[n].name}の得点は#{player[n].total}です。"
      data[player[n].name] = player[n].total - 21 if player[n].total <= 21
    end
    puts "#{dealer.name}の得点は#{dealer.total}です。"
    data[dealer.name] = dealer.total - 21 if dealer.total <= 21

    score = data.values
    winner_score = score.min_by { |n| (n - 0).abs }
    if winner_score.nil?
      puts '今回勝者はいません。'
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
member.times do |n|
  num = n + 1
  puts "#{num}人目の名前を教えて下さい。"
  name = gets.chomp
  st = !name.empty? ? name : 'あなた'
  @player << st
  # !name.empty? ? @player << name : @player << 'あなた'
end

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
