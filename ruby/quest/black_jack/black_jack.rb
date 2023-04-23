# frozen_string_literal: true

require_relative 'preparation'
require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'game'
require_relative 'player'
require_relative 'cpu'
require_relative 'dealer'
require_relative 'judge'
require 'tty-prompt'

# 準備を始める
preparation = Preparation.new
@cards = preparation.create_cards
@deck = preparation.create_deck(@cards)
@player_num = preparation.player_number
@cpu_num = @player_num > 1 ? preparation.cpu_number : 0
@player_set = preparation.player_decide
@cpu_set = preparation.cpu_decide if @cpu_num.positive?

@player = Player.create_player(@player_set)
@cpu = Cpu.create_cpu(@cpu_set) unless @cpu_set.nil?
@dealer = Dealer.new('ディーラー', Hand.new)

game = Game.new
game.start(@player, @cpu, @dealer, @deck)

@result = []
# プレイヤーのターン
@player.each do |p|
  hand_card = []
  hand_point = []
  p.hand.hand.size.times do |i|
    hand_card << p.hand.hand[i].keys[0]
    hand_point << p.hand.hand[i].values[0]
  end
  total_score = p.hand.total(hand_point)
  choice = p.choice(hand_card, total_score)
  while choice == '引く'
    @dealer.distribute(p, @deck)
    hand_card << p.hand.hand[-1].keys[0]
    hand_point << p.hand.hand[-1].values[0]
    total_score = p.hand.total(hand_point)
    choice = p.choice(hand_card, total_score)
  end
  if total_score > 21 && @player.size == 1 && @cpu.nil?
    puts 'ディーラーの勝ち'
    exit
  elsif total_score <= 21
    @result << { p.name => total_score }
  end
end

# CPUのターン
@cpu&.each do |c|
  hand_card = []
  hand_point = []
  c.hand.hand.size.times do |i|
    hand_card << c.hand.hand[i].keys[0]
    hand_point << c.hand.hand[i].values[0]
  end
  total = c.choice(hand_card, hand_point)
  while total < 18
    @dealer.distribute(c, @deck)
    hand_card << c.hand.hand[-1].keys[0]
    hand_point << c.hand.hand[-1].values[0]
    total = c.choice(hand_card, hand_point)
  end
  @result << { c.name => c.hand.total(hand_point) } if c.hand.total(hand_point) <= 21
end

if @result.empty?
  puts "#{@dealer.name}の勝ち"
  exit
end

# ディーラーのターン
puts "#{@dealer.name}の2枚目のカードは#{@dealer.hand.hand[-1].keys[0]}でした。"
hand_card = []
hand_point = []
@dealer.hand.hand.size.times do |i|
  hand_card << @dealer.hand.hand[i].keys[0]
  hand_point << @dealer.hand.hand[i].values[0]
end
total = @dealer.choice(hand_card, hand_point)
while total < 17
  @dealer.draw(@dealer, @deck)
  hand_card << @dealer.hand.hand[-1].keys[0]
  hand_point << @dealer.hand.hand[-1].values[0]
  total = @dealer.choice(hand_card, hand_point)
end

@judge = Judge.new(@dealer.hand.score)
@judge.judge(@player)
@judge.judge(@cpu)
