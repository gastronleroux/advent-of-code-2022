require_relative "forest"

input = File.read("day_08/input")
trees = Forest::Deserializer.new(input).deserialize

p trees.count(&:visible?)
