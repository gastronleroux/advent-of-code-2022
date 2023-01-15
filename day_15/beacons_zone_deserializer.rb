class BeaconsZoneDeserializer
  def initialize(input)
    @input = input
    @zone = Beacons::Zone.new
  end

  def deserialize
    input.scan(regex) do |sensor_x, sensor_y, beacon_x, beacon_y|
      sensor = zone.find_or_create_device(sensor_x.to_i, sensor_y.to_i, :sensor)
      beacon = zone.find_or_create_device(beacon_x.to_i, beacon_y.to_i, :beacon)

      sensor.set_closest_beacon(beacon)
    end

    zone
  end

  private

  attr_reader :input, :zone

  def regex
    /Sensor at x=(-?\d+), y=(-?\d+): closest beacon is at x=(-?\d+), y=(-?\d+)/
  end
end
