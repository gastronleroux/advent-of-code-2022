require_relative "terminal"

input = File.read("day_07/input")
root_directory = Terminal::LogsDeserializer.new(input).deserialize

space_needed = 30_000_000
available_space = 70_000_000
unused_space = available_space - root_directory.byte_size
missing_space = space_needed - unused_space

filtered_directories = root_directory.all_directories do |directory|
  directory.byte_size >= missing_space
end

p filtered_directories.min_by(&:byte_size).byte_size
