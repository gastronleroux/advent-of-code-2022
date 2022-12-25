class InputDeserializer
  class AdjustToOpponentStrategy
    OUTCOME_BY_SYMBOL = {
      "X" => RockPaperScissor::Constants::LOST_OUTCOME,
      "Y" => RockPaperScissor::Constants::DRAW_OUTCOME,
      "Z" => RockPaperScissor::Constants::WON_OUTCOME
    }.freeze

    def call(player_symbol:, opponent_symbol:)
      opponent_expected_choice = InputDeserializer::SymbolToChoiceStrategy.new.call(
        player_symbol: opponent_symbol
      )
      
      player_choice(player_symbol, opponent_expected_choice)
    end

    private

    def player_choice(player_symbol, opponent_expected_choice)
      case OUTCOME_BY_SYMBOL[player_symbol]
      when RockPaperScissor::Constants::LOST_OUTCOME
        RockPaperScissor::Constants::CHOICES_BY_STRENGTH[opponent_expected_choice]
      when RockPaperScissor::Constants::WON_OUTCOME
        RockPaperScissor::Constants::CHOICES_BY_WEAKNESS[opponent_expected_choice]
      when RockPaperScissor::Constants::DRAW_OUTCOME
        opponent_expected_choice
      else
        raise ArgumentError, "Invalid symbol: #{player_symbol}"
      end
    end
  end
end
