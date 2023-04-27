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
    @deck = preparate.create_deack
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
        @total_score = player.show_hand
        choose = player.choose
        choose == '引く' ? @dealer.hit_card(@deck, player) : break
      end
      @burst_check << 'ok' if @total_score <= 21
    end
  end

  def cpu_turn
    @cpu.each do |cpu|
      loop do
        @total_score = cpu.show_hand
        hit = cpu.auto_hit
        hit ? @dealer.hit_card(@deck, cpu) : break
      end
      @burst_check << 'ok' if @total_score <= 21
    end
  end

  def burst_check
    return unless @burst_check.empty?

    puts "全員バーストしました。#{@dealer.name}の勝ち。"
    puts 'ブラックジャックを終了します。'
    exit
  end

  def dealer_turn
    puts "#{@dealer.name}の2枚目のカードは#{@dealer.hand[-1].kind}でした。"
    loop do
      @dealer_score = @dealer.show_hand
      hit = @dealer.auto_hit
      hit ? @dealer.hit_card(@deck) : break
    end
  end

  def judge
    judge = Judge.new(@dealer_score)
    judge.result(@player)
    judge.result(@cpu)
  end

  def close
    puts 'ブラックジャックを終了します。'
  end
end
