# frozen_string_literal: true

require_relative 'participant'

# プレイヤークラス
class Player < Participant
  def self.create_player(player_set)
    player_set.map { |name| Player.new(name, Hand.new) }
  end

  def choice(hand_card, total)
    prompt = TTY::Prompt.new
    puts "#{name}の現在の手札は「#{hand_card.join('、')}」で、点数は「#{total}点」です。"
    puts 'ブラックジャック！' if hand_card.size == 2 && total == 21
    if total < 21
      prompt.select('カードを引きますか？', %w[引かない 引く])
    elsif total > 21
      puts 'バースト！'
    end
  end
end
