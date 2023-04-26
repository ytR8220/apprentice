# frozen_string_literal: true

require_relative './cpu'

# ディーラーの役割を持ったクラス
class Dealer < Cpu
  def deal_card(participant, deck)
    participant.each do |target|
      2.times do
        target.hand << deck.draw
        puts "#{target.name}に配られたカードは#{target.hand[-1].kind}です。"
      end
    end
  end

  def draw_card(deck)
    2.times do |i|
      hand << deck.draw
      if i.zero?
        puts "#{name}の1枚目のカードは#{hand[0].kind}です。"
      else
        puts "#{name}の2枚目のカードはわかりません。"
      end
    end
  end

  def hit_card(deck, target = self)
    target.hand << deck.draw
    puts "#{target.name}が引いたカードは#{target.hand[-1].kind}です。"
  end
end
