require_relative "beacons"
require_relative "beacons_zone_deserializer"
require "benchmark"

min_x = min_y = 0
max_x = max_y = 4_000_000
max_x_items = (min_x..max_x).size

zone = BeaconsZoneDeserializer.new(File.read("day_15/input")).deserialize.
  with_restricred_range(x_range: (min_x..max_x), y_range: (min_y..max_y))
  
y = (min_y..max_y).find { |y| zone.beaconless_x_count_on_row(y, false) < max_x_items }
ranges_with_x = zone.beaconless_x_ranges_on_row(y, false).sort_by(&:begin)
x = if ranges_with_x.size == 1
  ranges_with_x[0].begin != min_x ? min_x : ranges_with_x[0].end + 1
else
  ranges_with_x[1].begin != ranges_with_x[0].end + 1 ? ranges_with_x[1].begin - 1 : ranges_with_x[1].end + 1
end

puts x * 4_000_000 + y
