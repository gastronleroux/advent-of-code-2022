module RockPaperScissor
  module PlayerGame
    class RecordBuilder
      def initialize(game_record:, player_number:)
        @game_record = game_record
        @player_number = player_number
      end

      def build
        RockPaperScissor::PlayerGame::Record.new(
          player_choice: game_record.choice_for_player_number(player_number),
          opponent_choice: game_record.choice_for_player_number(opponent_number)
        )
      end

      private

      def opponent_number
        player_number == 1 ? 2 : 1
      end

      attr_reader :game_record, :player_number
    end
  end
end
