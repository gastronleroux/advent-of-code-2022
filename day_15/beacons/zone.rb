require "set"

module Beacons
  class Zone
    attr_reader :devices, :x_range, :y_range

    def initialize
      @devices = []

      infinity_range = -Float::INFINITY..Float::INFINITY
      define_ranges(x_range: infinity_range, y_range: infinity_range)
    end

    def with_restricted_range(x_range:, y_range:)
      define_ranges(x_range:, y_range:)

      self
    end

    def beacons
      devices.filter(&:beacon?)
    end

    def sensors
      devices.filter(&:sensor?)
    end

    def find_or_create_device(x, y, device_type)
      find_device(x, y) || create_device(x, y, device_type)
    end

    def find_device(x, y)
      devices.find { |device| device.x == x && device.y == y }
    end

    def create_device(x, y, device_type)
      device = Beacons::DeviceBuilder.new(x:, y:, device_type:).build
      devices << device

      device
    end

    def beaconless_x_count_on_row(y, count_devices = true)
      beaconless_x_ranges_on_row(y, count_devices).reduce(0) { |size, range| size + range.size }
    end

    def beaconless_x_ranges_on_row(y, count_devices = true)
      beaconless_x_ranges = sensors.each_with_object([]) do |sensor, ranges|
        distance_from_row = sensor.distance_to_closest_beacon - sensor.distance_to_coordinates(x: sensor.x, y:)
        next if distance_from_row < 0

        new_range = [sensor.x - distance_from_row, x_range.begin].max..[sensor.x + distance_from_row, x_range.end].min
        ranges.unshift(new_range)
        merge_overlapping_ranges(ranges)
      end

      adjust_x_ranges_covered_by_devices_on_row(beaconless_x_ranges, y) if count_devices

      beaconless_x_ranges
    end

    private

    def define_ranges(x_range:, y_range:)
      @x_range = x_range
      @y_range = y_range
    end

    def merge_overlapping_ranges(ranges)
      while (ranges_size = ranges.size) > 1
        ranges[1..].each_with_index do |range, index|
          next unless ranges_overlap?(ranges[0], range)

          ranges[0] = [ranges[0].begin, range.begin].min..[ranges[0].end, range.end].max
          ranges.delete_at(index + 1)
          break
        end

        break if ranges_size == ranges.size
      end
    end

    def ranges_overlap?(range_1, range_2)
      range_2.begin == range_1.begin || range_1.cover?(range_2.begin) || range_2.cover?(range_1.begin)
    end

    def adjust_x_ranges_covered_by_devices_on_row(x_ranges, y)
      x_of_devices_on_row = devices.filter_map { |device| device.x if device.y == y }
      x_of_devices_on_row.each do |x|
        range_covering_x_index = x_ranges.find_index { |range| range.cover?(x) }
        next if range_covering_x_index.nil?

        range_covering_x = x_ranges.delete_at(range_covering_x_index)
        x_ranges << (range_covering_x.begin..(x - 1)) if range_covering_x.begin < x
        x_ranges << ((x + 1)..range_covering_x.end) if x < range_covering_x.end
      end
    end
  end
end
