# frozen_string_literal: true

# 受け取ったマークと数字でトランプのカードとそれに応じた点数をプロパティとして持つインスタンス化ができる
class Card
  attr_reader :kind, :point

  def initialize(mark, num)
    @kind = "#{mark}の#{num}"
    @point =
      case num
      when 'A' then 11
      when 'J', 'Q', 'K' then 10
      else
        num
      end
  end
end
