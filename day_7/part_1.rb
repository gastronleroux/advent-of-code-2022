require_relative "terminal"

input = File.read("day_7/input")
root_directory = Terminal::LogsDeserializer.new(input).deserialize
filtered_directories = root_directory.all_directories do |directory|
  directory.byte_size >= 100_000
end

p filtered_directories.sum(&:byte_size)
