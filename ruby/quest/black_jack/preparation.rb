# frozen_string_literal: true

# 準備クラス
class Preparation
  def create_cards
    Card.new.create_cards
  end

  def create_deck(cards)
    Deck.new.create_deck(cards)
  end

  def player_number
    prompt = TTY::Prompt.new
    @player_num = prompt.select('プレイヤーの人数を教えて下さい。', %w[1 2 3]).to_i
    @cpu_num = 0 if @player_num < 2
    @player_num
  end

  def cpu_number
    prompt = TTY::Prompt.new
    cpu = prompt.select('あなが以外のメンバーをCPUにしますか？', %w[はい いいえ])
    case cpu
    when 'はい'
      @cpu_num = @player_num - 1
      @player_num - 1
    when 'いいえ'
      @cpu_num = 0
      @player_num
    end
  end

  def player_decide
    num = @player_num - @cpu_num
    player_set = []
    if num.zero?
      player_set << 'あなた'
    else
      num.times { |n| player_set << (n.zero? ? 'あなた' : "PLAYER#{n}") }
    end
    player_set
  end

  def cpu_decide
    cpu_set = []
    @cpu_num.times { |n| cpu_set << "CPU#{n + 1}" }
    cpu_set
  end
end
