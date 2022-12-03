

module RockPaperScissor
  module PlayerGame
    class PointsCalculator
      def initialize(choice:, outcome:)
        @choice = choice
        @outcome = outcome
      end

      def calculate
        RockPaperScissor::Constants::POINTS_BY_OUTCOME[outcome] +
          RockPaperScissor::Constants::POINTS_BY_CHOICE[choice]
      end

      private

      attr_reader :choice, :outcome
    end
  end
end
