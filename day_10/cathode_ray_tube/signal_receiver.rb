module CathodeRayTube
  class SignalReceiver
    attr_accessor :x
    attr_reader :cycle, :crt_draw_result, :cycles_to_track

    EXECUTORS_BY_SIGNAL = {
      :addx => CathodeRayTube::Signal::AddX,
      :noop => CathodeRayTube::Signal::NoOp
    }.freeze

    CRT_WIDTH = 40

    def initialize(cycles_to_track: [])
      @x = 1
      @cycle = 0
      @crt_draw_result = ""
      @cycles_to_track = cycles_to_track
    end

    def receive_signal(signal, args)
      EXECUTORS_BY_SIGNAL[signal].execute(self, args)
    end

    def add_cycle
      @cycle += 1
      update_crt_draw_result
      cycle_results[cycle] = x if cycles_to_track.include?(cycle)
    end

    def cycle_results
      @cycle_results ||= {}
    end

    def draw_crt
      crt_draw_result.each_char.each_slice(CRT_WIDTH).map(&:join)
    end

    private

    attr_writer :crt_draw_result

    def update_crt_draw_result
      crt_draw_result << ((x...x + 3).cover?(cycle % CRT_WIDTH) ? "#" : ".")
    end
  end
end
