module RockPaperScissor
  module PlayerGame
    class Analysis
      def initialize(player_record)
        @player_record = player_record
      end

      def choice
        @choice ||= player_record.player_choice
      end

      def outcome
        @outcome ||= RockPaperScissor::PlayerGame::OutcomeDecisor.new(player_record).decide
      end

      def points
        @points ||= RockPaperScissor::PlayerGame::PointsCalculator.new(choice:, outcome:).calculate
      end

      private

      attr_reader :player_record, :player_record
    end
  end
end
