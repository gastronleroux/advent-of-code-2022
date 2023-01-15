require_relative "beacons"
require_relative "beacons_zone_deserializer"

zone = BeaconsZoneDeserializer.new(File.read("day_15/input")).deserialize

puts zone.beaconless_x_count_on_row(2_000_000)
