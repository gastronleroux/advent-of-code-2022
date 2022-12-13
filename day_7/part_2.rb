require_relative "terminal"

input = File.read("day_7/input")
root_directory = Terminal::LogsDeserializer.new(input).deserialize
directories = root_directory.all_directories

space_needed = 30_000_000
available_space = 70_000_000
unused_space = available_space - root_directory.total_byte_size
missing_space = space_needed - unused_space

p directories.
  filter { |directory| directory.total_byte_size >= missing_space }.
  min { |a, b| a.total_byte_size <=> b.total_byte_size }.
  total_byte_size
