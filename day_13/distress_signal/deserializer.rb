module DistressSignal
  class Deserializer
    def initialize(input)
      @input = input
    end

    def deserialize
      input.split("\n\n").map do |raw_array_pairs|
        raw_array_pairs.split("\n").map do |raw_array|
          convert_to_packet(eval(raw_array))
        end
      end
    end

    private

    attr_reader :input

    def convert_to_packet(array)
      DistressSignal::Packet.new(
        array.map do |value|
          value.is_a?(Integer) ? value : convert_to_packet(value)
        end
      )
    end
  end
end
