module Beacons
  class Device
    attr_reader :x, :y

    def initialize(x:, y:)
      @x = x
      @y = y
    end

    Beacons::DEVICE_TYPES.each do |device_type|
      define_method("#{device_type}?") { self.device_type == device_type }
    end

    def device_type
      raise NotImplementedError
    end

    def distance_to(other)
      distance_to_coordinates(x: other.x, y: other.y)
    end

    def distance_to_coordinates(x:, y:)
      (self.x - x).abs + (self.y - y).abs
    end
  end
end
