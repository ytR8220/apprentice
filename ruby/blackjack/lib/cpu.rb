# frozen_string_literal: true

require_relative './player'

# cpuの数を受け取りその数だけのcpuインスタンスを生成できる
class Cpu < Player
  def self.create_cpu(cpu_num)
    cpu = []
    cpu_num.times do |n|
      cpu << Cpu.new("CPU#{n + 1}")
    end
    cpu
  end

  def auto_hit(hands)
    puts 'ブラックジャック！' if @hand_score == 21 && hands.size == 2
    if @hand_score > 21
      puts 'バースト！'
      0
    end
    @hand_score < 17
  end
end
