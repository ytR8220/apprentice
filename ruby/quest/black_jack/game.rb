# frozen_string_literal: true

# ゲームクラス
class Game
  def start(player, cpu, dealer, deck)
    puts 'ブラックジャックを開始します。'
    dealer.distribute_double(player, deck)
    dealer.distribute_double(cpu, deck) if cpu.instance_of?(Array)
    dealer.draw_double(dealer, deck)
  end
end
