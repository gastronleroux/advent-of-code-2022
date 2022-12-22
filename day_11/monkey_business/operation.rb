module MonkeyBusiness
  class Operation
    attr_reader :value_1, :operator, :value_2, :division_check_number, :output_by_division_check_result

    def initialize(value_1:, operator:, value_2:)
      @value_1 = value_1
      @operator = operator
      @value_2 = value_2
    end

    def call(variable)
      actual_value_1, actual_value_2 = [value_1, value_2].map do |value|
        value == :variable ? variable : value
      end

      actual_value_1.send(operator, actual_value_2)
    end
  end
end
