# frozen_string_literal: true

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