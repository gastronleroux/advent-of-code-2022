module Forest
  class Tree
    attr_accessor :visible
    attr_reader :height, :x, :y

    def initialize(height:, x:, y:)
      @height = height
      @x = x
      @y = y
    end

    def visible?
      visible_by_direction.values.any?
    end

    def visible_by_direction
      @visible_by_direction ||= Forest::DIRECTIONS.each_with_object({}) do |direction, hash|
        hash[direction] = false
      end
    end

    def scenic_score
      visible_trees_by_direction.values.reduce(:*)
    end

    def visible_trees_by_direction
      @visible_trees_by_direction ||= Forest::DIRECTIONS.each_with_object({}) do |direction, hash|
        hash[direction] = 0
      end
    end
  end
end
