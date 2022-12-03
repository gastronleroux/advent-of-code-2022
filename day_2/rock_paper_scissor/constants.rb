module RockPaperScissor
  module Constants
    ROCK_CHOICE = :rock
    PAPER_CHOICE = :paper
    SCISSOR_CHOICE = :scissor

    CHOICES = [ROCK_CHOICE, PAPER_CHOICE, SCISSOR_CHOICE].freeze

    CHOICES_BY_STRENGTH = {
      ROCK_CHOICE => SCISSOR_CHOICE,
      PAPER_CHOICE => ROCK_CHOICE,
      SCISSOR_CHOICE => PAPER_CHOICE
    }.freeze

    CHOICES_BY_WEAKNESS = CHOICES_BY_STRENGTH.invert.freeze

    LOST_OUTCOME = :lost
    WON_OUTCOME = :won
    DRAW_OUTCOME = :draw

    OUTCOMES = [LOST_OUTCOME, WON_OUTCOME, DRAW_OUTCOME].freeze
    
    POINTS_BY_CHOICE = {
      ROCK_CHOICE => 1,
      PAPER_CHOICE => 2,
      SCISSOR_CHOICE => 3
    }.freeze

    POINTS_BY_OUTCOME = {
      LOST_OUTCOME => 0,
      WON_OUTCOME => 6,
      DRAW_OUTCOME => 3
    }
  end
end
