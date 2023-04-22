# frozen_string_literal: true

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