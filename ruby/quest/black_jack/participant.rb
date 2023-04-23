# frozen_string_literal: true

# 参加者クラス
class Participant
  attr_reader :name, :hand

  def initialize(name, hand)
    @name = name
    @hand = hand
  end

  def choice(hand_card, hand_point)
    puts "#{name}の現在の手札は「#{hand_card.join('、')}」で、点数は「#{hand.total(hand_point)}点」です。"
    puts 'ブラックジャック！' if hand_card.size == 2 && hand.total(hand_point) == 21
    puts 'バースト！' if hand.total(hand_point) > 21
    hand.total(hand_point)
  end
end
