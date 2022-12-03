module RockPaperScissor
  module PlayerGame
    class OutcomeDecisor
      def initialize(player_record)
        @player_record = player_record
      end

      def decide
        return RockPaperScissor::Constants::DRAW_OUTCOME if draw?
        return RockPaperScissor::Constants::WON_OUTCOME if won?
        
        RockPaperScissor::Constants::LOST_OUTCOME
      end

      private

      attr_reader :player_record

      def draw?
        player_record.player_choice == player_record.opponent_choice
      end

      def won?
        RockPaperScissor::Constants::CHOICES_BY_STRENGTH[player_record.player_choice] ==
          player_record.opponent_choice
      end
    end
  end
end
