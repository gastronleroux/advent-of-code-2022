class InputDeserializer
  class SymbolToChoiceStrategy
    ROCK_SYMBOLS = %w(A X).freeze
    PAPER_SYMBOLS = %w(B Y).freeze
    SCISSOR_SYMBOLS = %w(C Z).freeze

    def call(player_symbol:, opponent_symbol: nil)
      symbol_to_choice(player_symbol)
    end

    private

    def symbol_to_choice(symbol)
      case symbol
      when *ROCK_SYMBOLS
        RockPaperScissor::Constants::ROCK_CHOICE
      when *PAPER_SYMBOLS
        RockPaperScissor::Constants::PAPER_CHOICE
      when *SCISSOR_SYMBOLS
        RockPaperScissor::Constants::SCISSOR_CHOICE
      else
        raise ArgumentError, "Invalid symbol: #{symbol}"
      end
    end
  end
end
