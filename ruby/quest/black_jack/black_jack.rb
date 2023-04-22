# frozen_string_literal: true

require_relative 'preparation'
require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'game'
require_relative 'player'
require_relative 'cpu'
require_relative 'dealer'
require 'tty-prompt'

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
