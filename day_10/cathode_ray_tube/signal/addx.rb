module CathodeRayTube
  module Signal
    class AddX
      def self.execute(signal_receiver, args)
        signal_receiver.add_cycle
        signal_receiver.add_cycle
        signal_receiver.x += args
      end
    end
  end
end
