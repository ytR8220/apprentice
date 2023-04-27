# frozen_string_literal: true

# プレイヤーの数を受け取り、その数のプレイヤーのインスタンスを生成できる。
class Player
  attr_reader :name, :hand

  def initialize(name)
    @name = name
    @hand = []
  end

  def self.create_player(player_num)
    player = []
    player_num.times do |n|
      player << (n.zero? ? Player.new('あなた') : Player.new("Player#{n}"))
    end
    player
  end

  def show_hand
    @hand_card = []
    hand.each { |hand| @hand_card << hand.kind }
    @hand_score = total(hand)
    puts "#{name}の手札は「#{@hand_card.join('、')}」で、合計点は#{@hand_score}点です。"
    @hand_score
  end

  def choose
    prompt = TTY::Prompt.new
    puts 'ブラックジャック！' if @hand_score == 21 && @hand_card.size == 2
    if @hand_score > 21
      puts 'バースト！'
      0
    elsif @hand_score < 21
      prompt.select('カードを引きますか？', %w[引かない 引く])
    end
  end

  def total(hands)
    score = 0
    hand_point = []
    hands.each do |hand|
      hand_point << hand.point.to_i
    end
    hand_point.sort.map do |n|
      n = 1 if n == 11 && score + n > 21
      score += n
    end
    score
  end
end
