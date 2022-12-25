require_relative "rock_paper_scissor"
require_relative "input_file_handler"
require_relative "input_deserializer"

game_records = InputDeserializer.new(
  input: InputFileHandler.read,
  choice_strategy_for_player_2: InputDeserializer::AdjustToOpponentStrategy.new
).deserialize

player_records = game_records.map do |game_record|
  RockPaperScissor::PlayerGame::RecordBuilder.new(
    game_record: game_record,
    player_number: 2
  ).build
end

player_game_analyses = player_records.map do |player_record|
  RockPaperScissor::PlayerGame::Analysis.new(player_record)
end

p player_game_analyses.sum(&:points)
