module CathodeRayTube
  class CpuProgramExecutor
    def initialize(signal_receiver:, program:)
      @signal_receiver = signal_receiver
      @program = program
    end

    def execute
      program.split("\n").each do |signals|
        signal_name, arg = signals.split(" ")
        signal_receiver.receive_signal(signal_name.to_sym, arg.to_i)
      end
    end

    private

    attr_reader :signal_receiver, :program
  end
end
