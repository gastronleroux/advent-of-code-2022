require_relative "forest"

input = File.read("day_8/input")
trees = Forest::Deserializer.new(input).deserialize

p trees.map(&:scenic_score).max
