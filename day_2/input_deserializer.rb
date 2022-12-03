require_relative "input_deserializer/symbol_to_choice_strategy"
require_relative "input_deserializer/adjust_to_opponent_strategy"

class InputDeserializer
  DEFAULT_CHOICE_STRATEGY = InputDeserializer::SymbolToChoiceStrategy.new

  def initialize(input:, choice_strategy_for_player_1: nil, choice_strategy_for_player_2: nil)
    @input = input
    @choice_strategy_for_player_1 = choice_strategy_for_player_1 || DEFAULT_CHOICE_STRATEGY
    @choice_strategy_for_player_2 = choice_strategy_for_player_2 || DEFAULT_CHOICE_STRATEGY
  end

  def deserialize
    input.split("\n").map do |line|
      player_1_symbol, player_2_symbol = line.split(" ")

      player_1_choice = choice_strategy_for_player_1.call(
        player_symbol: player_1_symbol,
        opponent_symbol: player_2_symbol
      )
      player_2_choice = choice_strategy_for_player_2.call(
        player_symbol: player_2_symbol,
        opponent_symbol: player_1_symbol
      )

      RockPaperScissor::GameRecord.new(player_1_choice:, player_2_choice:)
    end
  end

  private

  attr_reader :input, :choice_strategy_for_player_1, :choice_strategy_for_player_2
end
