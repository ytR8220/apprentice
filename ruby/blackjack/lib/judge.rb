# frozen_string_literal: true

# 勝敗を決めるクラス
class Judge
  def initialize(dealer_score)
    @dealer_score = dealer_score <= 21 ? dealer_score : 0
  end

  def result(challengers)
    challengers.each do |challenger|
      challenger_score = challenger.total_score <= 21 ? challenger.total_score : 0
      if challenger_score == @dealer_score
        puts "#{challenger.name}は引き分けです。"
      elsif challenger_score > @dealer_score
        puts "#{challenger.name}は勝ちました！"
      else
        puts "#{challenger.name}は負けました。"
      end
    end
  end
end
