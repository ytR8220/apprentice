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

  def judge(hand_card, hand_point)
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

  def judge(hand_card, hand_point)
    prompt = TTY::Prompt.new
    puts "#{name}の現在の手札は「#{hand_card.join('、')}」で、点数は「#{total(hand_point)}点」です。"
    puts 'ブラックジャック！' if hand_card.size == 2 && total(hand_point) == 21
    if total(hand_point) < 21
      prompt.select('カードを引きますか？', %w[引かない 引く])
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
  def distribute_double(player, deck)
    player.each do |p|
      2.times do
        p.hand << deck.pop
        puts "#{p.name}に配られたカードは#{p.hand[-1].keys[0]}です。"
      end
    end
  end

  def distribute(player, deck)
    player.hand << deck.pop
    puts "#{player.name}に配られたカードは#{player.hand[-1].keys[0]}です。"
  end

  def draw_double(dealer, deck)
    2.times do |i|
      dealer.hand << deck.pop
      if i.zero?
        puts "#{dealer.name}の1枚目のカードは#{dealer.hand[0].keys[0]}です。"
      else
        puts "#{dealer.name}の2枚目のカードはわかりません。"
      end
    end
  end

  def draw(dealer, deck)
    dealer.hand << deck.pop
    puts "#{dealer.name}が引いたカードは#{dealer.hand[-1].keys[0]}です。"
  end
end

# カードクラス
class Card
  def create_cards
    cards = []
    mark = %w[スペード ダイヤ ハート クラブ]
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

# デッキクラス
class Deck
  def create_deck(cards)
    cards.shuffle!
  end
end

# 手札クラス
class Hand
  attr_reader :hand

  def initialize
    @hand = []
  end
end

# 準備クラス
class Preparation
  def create_cards
    Card.new.create_cards
  end

  def create_deck(cards)
    Deck.new.create_deck(cards)
  end

  def player_number
    prompt = TTY::Prompt.new
    @player_num = prompt.select('プレイヤーの人数を教えて下さい。', %w[1 2 3]).to_i
    @cpu_num = 0 if @player_num < 2
    @player_num
  end

  def cpu_number
    prompt = TTY::Prompt.new
    cpu = prompt.select('あなが以外のメンバーをCPUにしますか？', %w[はい いいえ])
    case cpu
    when 'はい'
      @cpu_num = @player_num - 1
      @player_num - 1
    when 'いいえ'
      @cpu_num = 0
      @player_num
    end
  end

  def player_decide
    num = @player_num - @cpu_num
    player_set = []
    if num.zero?
      player_set << 'あなた'
    else
      num.times { |n| player_set << (n.zero? ? 'あなた' : "PLAYER#{n}") }
    end
    player_set
  end

  def cpu_decide
    cpu_set = []
    @cpu_num.times { |n| cpu_set << "CPU#{n + 1}" }
    cpu_set
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

# 準備を始める
preparation = Preparation.new
@cards = preparation.create_cards
@deck = preparation.create_deck(@cards)
@player_num = preparation.player_number
@cpu_num = @player_num > 1 ? preparation.cpu_number : 0
@player_set = preparation.player_decide
@cpu_set = preparation.cpu_decide if @cpu_num.positive?

hand = Hand.new
@player = Player.create_player(@player_set, hand)
@cpu = Cpu.create_cpu(@cpu_set, hand) unless @cpu_set.nil?
@dealer = Dealer.new('ディーラー', hand)

game = Game.new
game.start

# ディーラーがプレイヤーにカードを配る
@dealer.distribute_double(@player, @deck)

# CPUがいればディーラーはCPUにカードを配る
@dealer.distribute_double(@cpu, @deck) if @cpu.instance_of?(Array)

# ディーラーが自分自身にカードを配る
@dealer.draw_double(@dealer, @deck)

@result = []
# プレイヤーのターン
@player.each do |p|
  hand_card = []
  hand_point = []
  p.hand.size.times do |i|
    hand_card << p.hand[i].keys[0]
    hand_point << p.hand[i].values[0]
  end
  judge = p.judge(hand_card, hand_point)
  while judge == '引く'
    @dealer.distribute(p, @deck)
    hand_card << p.hand[-1].keys[0]
    hand_point << p.hand[-1].values[0]
    judge = p.judge(hand_card, hand_point)
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
  total = c.judge(hand_card, hand_point)
  while total < 18
    @dealer.distribute(c, @deck)
    hand_card << c.hand[-1].keys[0]
    hand_point << c.hand[-1].values[0]
    total = c.judge(hand_card, hand_point)
  end
  @result << { c.name => c.total(hand_point) } if c.total(hand_point) <= 21
end

if @result.empty?
  puts "#{@dealer.name}の勝ち"
  exit
end

# ディーラーのターン
puts "#{@dealer.name}の2枚目のカードは#{@dealer.hand[-1].keys[0]}でした。"
hand_card = []
hand_point = []
@dealer.hand.size.times do |i|
  hand_card << @dealer.hand[i].keys[0]
  hand_point << @dealer.hand[i].values[0]
end
total = @dealer.judge(hand_card, hand_point)
while total < 17
  @dealer.draw(@dealer, @deck)
  hand_card << @dealer.hand[-1].keys[0]
  hand_point << @dealer.hand[-1].values[0]
  total = @dealer.judge(hand_card, hand_point)
end
@dealer_result = @dealer.total(hand_point) <= 21 ? @dealer.total(hand_point) : 0

# 勝敗を決める
@winner = game.duel(@result, @dealer_result)
game.winner(@winner)
