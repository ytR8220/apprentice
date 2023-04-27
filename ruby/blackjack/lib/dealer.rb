# frozen_string_literal: true

require_relative './cpu'

# ディーラーの役割を持ったクラス
class Dealer < Cpu
  def deal_card(participant, deck)
    participant.each do |target|
      2.times do
        target.hands << deck.draw
        puts "#{target.name}に配られたカードは#{target.hands[-1].kind}です。"
      end
    end
  end

  def draw_card(deck)
    2.times do |i|
      hands << deck.draw
      if i.zero?
        puts "#{name}の1枚目のカードは#{hands[0].kind}です。"
      else
        puts "#{name}の2枚目のカードはわかりません。"
      end
    end
  end

  def hit_card(deck, target = self)
    target.hands << deck.draw
    puts "#{target.name}が引いたカードは#{target.hands[-1].kind}です。"
  end
end
