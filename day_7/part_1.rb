require_relative "terminal"

input = File.read("day_7/input")
directories = Terminal::LogsDeserializer.new(input).deserialize.all_directories

p directories.filter { |directory| directory.total_byte_size <= 100_000 }.sum(&:total_byte_size)
