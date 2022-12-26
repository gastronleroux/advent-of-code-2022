require_relative "./distress_signal"

input = File.read("day_13/input")
additional_packets = [DistressSignal::Packet.new([2]), DistressSignal::Packet.new([6])]
input_packets = DistressSignal::Deserializer.new(input).deserialize.flatten(1)
sorted_packets = (input_packets + additional_packets).sort

p additional_packets.map { |packet| sorted_packets.index(packet) + 1 }.reduce(:*)
