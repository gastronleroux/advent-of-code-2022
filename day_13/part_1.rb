require_relative "./distress_signal"

input = File.read("day_13/input")
packet_pairs = DistressSignal::Deserializer.new(input).deserialize

p packet_pairs.filter_map.with_index { |(a, b), index| index + 1 if a <= b }.sum
