# frozen_string_literal: true

# ゲームクラス
class Game
  def start(player, cpu, dealer, deck)
    puts 'ブラックジャックを開始します。'
    # ディーラーがプレイヤーにカードを配る
    dealer.distribute_double(player, deck)
    # CPUがいればディーラーはCPUにカードを配る
    dealer.distribute_double(cpu, deck) if cpu.instance_of?(Array)
    # ディーラーが自分自身にカードを配る
    dealer.draw_double(dealer, deck)
  end
end
