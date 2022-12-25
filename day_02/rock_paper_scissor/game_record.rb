module RockPaperScissor
  class GameRecord
    attr_reader :player_1_choice, :player_2_choice

    def initialize(player_1_choice:, player_2_choice:)
      @player_1_choice = player_1_choice
      @player_2_choice = player_2_choice
    end

    def choice_for_player_number(player_number)
      case player_number
      when 1 then player_1_choice
      when 2 then player_2_choice
      else
        raise ArgumentError, "Invalid player number: #{player_number}"
      end
    end
  end
end
