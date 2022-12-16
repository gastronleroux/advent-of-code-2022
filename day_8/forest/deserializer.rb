module Forest
  class Deserializer
    def initialize(input)
      @input = input
    end
    
    def deserialize
      forest.each_with_index do |forest_line, y|
        forest_line.each_with_index do |tree_height, x|
          tree = Forest::Tree.new(height: tree_height, x: x, y: y)
          Forest::DIRECTIONS.each { |direction| travel_to_edge(tree, direction) }

          trees << tree
        end
      end

      trees
    end

    private

    attr_reader :input

    def travel_to_edge(tree, direction)
      x, y = tree.x, tree.y, tree.height

      loop do
        x, y = travel_position_by_direction(x, y, direction)
        next_tree_height = x.negative? || y.negative? ? nil : forest.dig(y, x)

        if next_tree_height.nil?
          tree.visible_by_direction[direction] = true
          break
        end
        
        tree.visible_trees_by_direction[direction] += 1
        break if next_tree_height >= tree.height
      end
    end

    def travel_position_by_direction(x, y, direction)
      case direction
      when Forest::LEFT_DIRECTION
        [x - 1, y]
      when Forest::RIGHT_DIRECTION
        [x + 1, y]
      when Forest::UP_DIRECTION
        [x, y - 1]
      when Forest::DOWN_DIRECTION
        [x, y + 1]
      end
    end

    # @return [Array<Forest::Tree>]
    def trees
      @trees ||= []
    end

    # @return [Array<Array<Integer>>]
    def forest
      @lines ||= input.split("\n").map { |line| line.chars.map(&:to_i) }
    end
  end
end
