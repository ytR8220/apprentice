# frozen_string_literal: true

require_relative './card'

# カードインスタンスを生成してデッキを作成するクラス
class Deck
  attr_reader :deck

  def initialize
    @deck = []
    mark = %w[スペード ダイヤ ハート クラブ]
    num = %w[A 2 3 4 5 6 7 8 9 J Q K]
    mark.each do |suits|
      num.each do |number|
        @deck << Card.new(suits, number)
      end
    end
    @deck.shuffle!
  end

  def draw
    @deck.pop
  end
end
