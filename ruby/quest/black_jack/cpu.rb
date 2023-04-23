# frozen_string_literal: true

require_relative 'participant'

# CPUクラス
class Cpu < Participant
  def self.create_cpu(cpu_set)
    cpu_set.map { |name| Cpu.new(name, Hand.new) }
  end
end
