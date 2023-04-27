# frozen_string_literal: true

require_relative './player'
require_relative './cpu'
require_relative './dealer'
require_relative './deck'
require 'tty-prompt'

# ゲームの準備を行うクラス
class Preparate
  attr_reader :player, :cpu, :dealer, :deck

  def initialize
    prompt = TTY::Prompt.new
    @member = prompt.select('何人で遊びますか？', %w[1 2 3]).to_i
    max_player = @member > 1 ? @member : 1
    @player_num = @member > 1 ? prompt.select('プレイヤーの人数を教えて下さい。', (1..max_player).to_a).to_i : 1
  end

  def player_set
    Player.create_player(@player_num)
  end

  def cpu_set
    Cpu.create_cpu(@member - @player_num)
  end

  def dealer_set
    Dealer.new('ディーラー')
  end

  def create_deack
    Deck.new
  end
end
