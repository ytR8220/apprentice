# frozen_string_literal: true

require_relative 'participant'

# プレイヤークラス
class Player < Participant
  def self.create_player(player_set, hand)
    player_set.map { |name| Player.new(name, hand) }
  end

  def judge(hand_card, hand_point)
    prompt = TTY::Prompt.new
    puts "#{name}の現在の手札は「#{hand_card.join('、')}」で、点数は「#{total(hand_point)}点」です。"
    puts 'ブラックジャック！' if hand_card.size == 2 && total(hand_point) == 21
    if total(hand_point) < 21
      prompt.select('カードを引きますか？', %w[引かない 引く])
    elsif total(hand_point) > 21
      puts 'バースト！'
    else
      total(hand_point)
    end
  end
end
