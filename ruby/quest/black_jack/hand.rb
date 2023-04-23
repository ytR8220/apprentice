# frozen_string_literal: true

# 手札クラス
class Hand
  attr_reader :hand, :score

  def initialize
    @hand = []
  end

  def total(hand_point)
    @score = 0
    hand_point.map do |n|
      n = 1 if n == 11 && @score + n > 21
      @score += n
    end
    @score
  end
end
