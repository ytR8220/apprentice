# frozen_string_literal: true

require 'debug'
require 'tty-prompt'

# 参加者クラス
class Participant
  attr_reader :name, :hand

  def initialize(name, _hand)
    @name = name
    @hand = []
  end

  def total(hand_point)
    total = 0
    hand_point.map do |n|
      n = 1 if n == 11 && total + n > 21
      total += n
    end
    total
  end

  def choice(hand_card, hand_point)
    puts "#{name}の現在の手札は「#{hand_card.join('、')}」で、点数は「#{total(hand_point)}点」です。"
    puts 'ブラックジャック！' if hand_card.size == 2 && total(hand_point) == 21
    puts 'バースト！' if total(hand_point) > 21
    total(hand_point)
  end
end

# プレイヤークラス
class Player < Participant
  def self.create_player(player_set, hand)
    player_set.map { |name| Player.new(name, hand) }
  end

  def choice(hand_card, hand_point)
    prompt = TTY::Prompt.new
    puts "#{name}の現在の手札は「#{hand_card.join('、')}」で、点数は「#{total(hand_point)}点」です。"
    puts 'ブラックジャック！' if hand_card.size == 2 && total(hand_point) == 21
    if total(hand_point) < 21
      prompt.select('カードを引きますか？', %w[引く 引かない])
    elsif total(hand_point) > 21
      puts 'バースト！'
    else
      total(hand_point)
    end
  end
end

# CPUクラス
class Cpu < Participant
  def self.create_cpu(cpu_set, hand)
    cpu_set.map { |name| Cpu.new(name, hand) }
  end
end

# ディーラークラス
class Dealer < Participant
  def distribute(deck)
    deck.pop
  end
end

# カードクラス
class Card
  def self.create_cards(mark)
    cards = []
    mark.each do |n|
      cards << { "#{n}のA": 11 }
      2.upto(10) { |i| cards << { "#{n}の#{i}": i } }
      cards << { "#{n}のJ": 10 }
      cards << { "#{n}のQ": 10 }
      cards << { "#{n}のK": 10 }
    end
    cards
  end
end

# 手札クラス
class Hand
  attr_reader :hand

  def initialize
    @hand = []
  end
end

# ゲームクラス
class Game
  def start
    puts 'ブラックジャックを開始します。'
  end

  def duel(result, dealer_result)
    winner = ['ディーラー']
    result.each do |hand|
      if hand.values[0] > dealer_result
        winner.delete('ディーラー') if winner.include?('ディーラー')
        winner << hand.keys[0]
      elsif hand.values[0] == dealer_result
        winner.delete('ディーラー') if winner.include?('ディーラー')
      end
    end
    winner
  end

  def winner(winner)
    if !winner.empty?
      winner = winner.join('、')
      puts "「#{winner}」の勝ち！"
    else
      puts '引き分け'
    end
  end
end

# デッキの構築
mark = %w[スペード ダイヤ ハート クラブ]
@deck = Card.create_cards(mark).shuffle!

# プレイ人数の確認
@player_set = []
puts 'プレイヤーの人数を教えて下さい。'
puts '1.1人'
puts '2.2人'
puts '3.3人'
member = gets.chomp.to_i
if member > 1
  print 'あなが以外のメンバーをCPUにしますか？ (y/n)'
  cpu = gets
  case cpu
  when /^[yY]/
    bot = true
    @cpu_set = []
  when /^[nN]/
    bot = false
  end
end
member.times do |n|
  if bot
    n.zero? ? @player_set << 'あなた' : @cpu_set << "CPU#{n}"
  else
    @player_set << (n.zero? ? 'あなた' : "PLAYER#{n}")
  end
end

hand = Hand.new
p hand
# プレイヤーインスタンスの生成
@player = Player.create_player(@player_set, hand)
# cpuインスタンスの生成
@cpu = Cpu.create_cpu(@cpu_set, hand) unless @cpu_set.nil?
p @cpu
# ディーラーインスタンスの生成
@dealer = Dealer.new('ディーラー', hand)

game = Game.new
game.start

# ディーラーがプレイヤーにカードを配る
@player.size.times do |n|
  2.times do
    @player[n].hand << @dealer.distribute(@deck)
    puts "#{@player[n].name}に配られたカードは#{@player[n].hand[-1].keys[0]}です。"
  end
end

# CPUがいればディーラーはCPUにカードを配る
@cpu&.each do |c|
  2.times do
    c.hand << @dealer.distribute(@deck)
    puts "#{c.name}に配られたカードは#{c.hand[-1].keys[0]}です。"
  end
end

# ディーラーが自分自身にカードを配る
2.times do |i|
  @dealer.hand << @dealer.distribute(@deck)
  if i.zero?
    puts "ディーラーの1枚目のカードは#{@dealer.hand[0].keys[0]}です。"
  else
    puts 'ディーラーの2枚目のカードはわかりません。'
  end
end

@result = []
# プレイヤーのターン
@player.each do |p|
  hand_card = []
  hand_point = []
  p.hand.size.times do |i|
    hand_card << p.hand[i].keys[0]
    hand_point << p.hand[i].values[0]
  end
  choice = p.choice(hand_card, hand_point)
  while choice == '引く'
    p.hand << @dealer.distribute(@deck)
    puts "#{p.name}に配られたカードは#{p.hand[-1].keys[0]}です。"
    hand_card << p.hand[-1].keys[0]
    hand_point << p.hand[-1].values[0]
    choice = p.choice(hand_card, hand_point)
  end
  if p.total(hand_point) > 21 && @player.size == 1 && @cpu.nil?
    puts 'ディーラーの勝ち'
    exit
  elsif p.total(hand_point) <= 21
    @result << { p.name => p.total(hand_point) }
  end
end

# CPUのターン
@cpu&.each do |c|
  hand_card = []
  hand_point = []
  c.hand.size.times do |i|
    hand_card << c.hand[i].keys[0]
    hand_point << c.hand[i].values[0]
  end
  total = c.choice(hand_card, hand_point)
  while total < 18
    c.hand << @dealer.distribute(@deck)
    puts "#{c.name}に配られたカードは#{c.hand[-1].keys[0]}です。"
    hand_card << c.hand[-1].keys[0]
    hand_point << c.hand[-1].values[0]
    total = c.choice(hand_card, hand_point)
  end
  @result << { c.name => c.total(hand_point) } if c.total(hand_point) <= 21
end

if @result.empty?
  puts 'ディーラーの勝ち'
  exit
end

# ディーラーのターン
puts "ディーラーの2枚目のカードは#{@dealer.hand[-1].keys[0]}でした。"
hand_card = []
hand_point = []
@dealer.hand.size.times do |i|
  hand_card << @dealer.hand[i].keys[0]
  hand_point << @dealer.hand[i].values[0]
end
total = @dealer.choice(hand_card, hand_point)
while total < 17
  @dealer.hand << @dealer.distribute(@deck)
  puts "ディーラーが引いたカードは#{@dealer.hand[-1].keys[0]}です。"
  hand_card << @dealer.hand[-1].keys[0]
  hand_point << @dealer.hand[-1].values[0]
  total = @dealer.choice(hand_card, hand_point)
end
@dealer_result = if @dealer.total(hand_point) <= 21
                   @dealer.total(hand_point)
                 else
                   0
                 end

# 勝敗を決める
@winner = game.duel(@result, @dealer_result)
game.winner(@winner)
