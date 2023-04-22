# frozen_string_literal: true

require_relative 'participant'

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
