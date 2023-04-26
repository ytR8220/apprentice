# frozen_string_literal: true

require_relative './preparate'
require_relative './judge'

# ゲーム全体の流れを担うクラス
class Game
  def initialize
    preparate = Preparate.new
    @player = preparate.player_set
    @cpu = preparate.cpu_set
    @dealer = preparate.dealer_set
    @deck = preparate.deck_create
    @burst_check = []
  end

  def start
    puts 'ブラックジャックを開始します。'
    @dealer.deal_card(@player, @deck)
    @dealer.deal_card(@cpu, @deck)
    @dealer.draw_card(@deck)
  end

  def player_turn
    @player.each do |player|
      loop do
        player.show_hand(player.hand)
        choose = player.choose(player.hand)
        choose == '引く' ? @dealer.hit_card(player, @deck) : break
      end
      @burst_check << 'ture' if player.total(player.hand) <= 21
    end
  end

  def cpu_turn
    @cpu.each do |cpu|
      loop do
        cpu.show_hand(cpu.hand)
        hit = cpu.auto_hit(cpu.hand)
        hit ? @dealer.hit_card(@deck, cpu) : break
      end
      @burst_check << 'ture' if cpu.total(cpu.hand) <= 21
    end
  end

  def burst_check
    return unless @burst_check.empty?

    puts "全員バーストしました。#{@dealer.name}の勝ち"
    exit
  end

  def dealer_turn
    puts "#{@dealer.name}の2枚目のカードは#{@dealer.hand[-1].kind}でした。"
    loop do
      @dealer.show_hand(@dealer.hand)
      hit = @dealer.auto_hit(@dealer.hand)
      hit ? @dealer.hit_card(@deck) : break
    end
  end

  def judge
    judge = Judge.new(@dealer.total(@dealer.hand))
    judge.result(@player)
    judge.result(@cpu)
  end

  def close
    puts 'ブラックジャックを終了します。'
  end
end
