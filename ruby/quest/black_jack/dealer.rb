# frozen_string_literal: true

require_relative 'participant'

# ディーラークラス
class Dealer < Participant
  def distribute_double(player, deck)
    player.each do |p|
      2.times do
        p.hand.hand << deck.pop
        puts "#{p.name}に配られたカードは#{p.hand.hand[-1].keys[0]}です。"
      end
    end
  end

  def distribute(player, deck)
    player.hand.hand << deck.pop
    puts "#{player.name}に配られたカードは#{player.hand.hand[-1].keys[0]}です。"
  end

  def draw_double(dealer, deck)
    2.times do |i|
      dealer.hand.hand << deck.pop
      if i.zero?
        puts "#{dealer.name}の1枚目のカードは#{dealer.hand.hand[0].keys[0]}です。"
      else
        puts "#{dealer.name}の2枚目のカードはわかりません。"
      end
    end
  end

  def draw(dealer, deck)
    dealer.hand.hand << deck.pop
    puts "#{dealer.name}が引いたカードは#{dealer.hand.hand[-1].keys[0]}です。"
  end
end
