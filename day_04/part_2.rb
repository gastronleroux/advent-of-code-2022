lines = File.open("day_04/input", "r").readlines
pairs_of_ranges = lines.map do |line|
  line.split(",").map { |range| Range.new(*range.split("-").map(&:to_i)) }
end
overlapping_pairs_of_ranges = pairs_of_ranges.filter do |(first_range, second_range)|
  second_range.begin <= first_range.end && first_range.begin <= second_range.end 
end

p overlapping_pairs_of_ranges.count
