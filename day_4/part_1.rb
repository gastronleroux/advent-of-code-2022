lines = File.open("day_4/input", "r").readlines
pairs_of_ranges = lines.map do |line|
  line.split(",").map { |range| Range.new(*range.split("-").map(&:to_i)) }
end
contained_pairs_of_ranges = pairs_of_ranges.filter do |(first_range, second_range)|
  first_range.cover?(second_range) || second_range.cover?(first_range)
end

p contained_pairs_of_ranges.count
