# frozen_string_literal: true

# プレイヤーの数を受け取り、その数のプレイヤーのインスタンスを生成できる。
class Player
  attr_reader :name, :hands, :total_score

  def initialize(name)
    @name = name
    @hands = []
    @total_score = 0
  end

  def self.create_player(player_num)
    player = []
    player_num.times do |n|
      player << (n.zero? ? Player.new('あなた') : Player.new("Player#{n}"))
    end
    player
  end

  def show_hand
    @hands_card = []
    @hands.each { |hand| @hands_card << hand.kind }
    @total_score = total
    puts "#{name}の手札は「#{@hands_card.join('、')}」で、合計点は「#{@total_score}点」です。"
  end

  def choose
    prompt = TTY::Prompt.new
    puts 'ブラックジャック！' if @total_score == 21 && @hands_card.size == 2
    if @total_score > 21
      puts 'バースト！'
      0
    elsif @total_score < 21
      prompt.select('カードを引きますか？', %w[引かない 引く])
    end
  end

  private

  def total
    score = 0
    hand_point = []
    @hands.each do |hand|
      hand_point << hand.point.to_i
    end
    hand_point.sort.map do |n|
      n = 1 if n == 11 && score + n > 21
      score += n
    end
    score
  end
end
