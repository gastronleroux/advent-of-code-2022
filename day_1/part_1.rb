class CaloriesHunter
  def initialize(input)
    @input = input
  end

  def hunt
    max_calories
  end

  private

  attr_reader :input

  def max_calories
    summed_calories.max
  end

  def summed_calories
    grouped_calories.map(&:sum)
  end

  def grouped_calories
    input.split(/\n\n/).map do |string_calories|
      string_calories.split(/\n/).map(&:to_i)
    end
  end
end

p CaloriesHunter.new(File.open("day_1/input", "r").read).hunt
