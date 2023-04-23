# frozen_string_literal: true

# 判定クラス
class Judge
  def initialize(dealer_score)
    @dealer_score = dealer_score <= 21 ? dealer_score : 0
  end

  def judge(opponent)
    opponent&.each do |opp|
      opp_score = opp.hand.score <= 21 ? opp.hand.score : 0
      if opp_score == @dealer_score
        puts "#{opp.name}は引き分けです。"
      elsif opp_score > @dealer_score
        puts "#{opp.name}は勝ちました！"
      else
        puts "#{opp.name}は負けました。"
      end
    end
  end
end
