# frozen_string_literal: true

# ゲームクラス
class Game
  def start
    puts 'ブラックジャックを開始します。'
  end

  def duel(result, dealer_result)
    winner = ['ディーラー']
    result.each do |hand|
      if hand.values[0] > dealer_result
        winner.delete('ディーラー') if winner.include?('ディーラー')
        winner << hand.keys[0]
      elsif hand.values[0] == dealer_result
        winner.delete('ディーラー') if winner.include?('ディーラー')
      end
    end
    winner
  end

  def winner(winner)
    if !winner.empty?
      winner = winner.join('、')
      puts "「#{winner}」の勝ち！"
    else
      puts '引き分け'
    end
  end
end