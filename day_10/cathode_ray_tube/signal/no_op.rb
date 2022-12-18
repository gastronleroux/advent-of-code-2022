module CathodeRayTube
  module Signal
    class NoOp
      def self.execute(signal_receiver, args = nil)
        signal_receiver.add_cycle
      end
    end
  end
end
