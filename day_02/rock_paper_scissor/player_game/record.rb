module RockPaperScissor
  module PlayerGame
    class Record
      attr_reader :player_choice, :opponent_choice

      def initialize(player_choice:, opponent_choice:)
        @player_choice = player_choice
        @opponent_choice = opponent_choice
      end
    end
  end
end
