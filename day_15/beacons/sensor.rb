module Beacons
  class Sensor < Device
    attr_reader :closest_beacon

    def set_closest_beacon(beacon)
      @closest_beacon = beacon
    end

    def distance_to_closest_beacon
      @distance_to_closest_beacon ||= distance_to(closest_beacon)
    end

    def device_type
      :sensor
    end
  end
end
