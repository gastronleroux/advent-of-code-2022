module Beacons
  class DeviceBuilder
    def initialize(x:, y:, device_type:)
      @x = x
      @y = y
      @device_type = device_type
    end

    def build
      case device_type
      when :sensor then Beacons::Sensor.new(x:, y:)
      when :beacon then Beacons::Beacon.new(x:, y:)
      else raise "Unknown device type: #{device_type}"
      end
    end

    private

    attr_reader :x, :y, :device_type
  end
end
