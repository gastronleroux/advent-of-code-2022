module DistressSignal
  class Packet < Array
    include Comparable

    def self.convert_to_packet(value)
      case value
      when Array then DistressSignal::Packet.new(value)
      when Integer then DistressSignal::Packet.new([value])
      when DistressSignal::Packet then value
      else
        raise "Unsupported conversion of #{value.class} to DistressSignal::Packet"
      end
    end

    def <=>(other)
      other_packet = self.class.convert_to_packet(other)
      range = (0...[length, other.length].max)

      range.each do |index|
        value = self[index]
        other_value = other_packet[index]

        return -1 if value.nil?
        return 1 if other_value.nil?

        values_are_integers = value.is_a?(Integer) && other_value.is_a?(Integer)
        value = self.class.convert_to_packet(value) unless values_are_integers
        other_value = self.class.convert_to_packet(other_value) unless values_are_integers
        values_comparison = value <=> other_value

        next if values_comparison.zero?
        return values_comparison
      end

      0
    end
  end
end
