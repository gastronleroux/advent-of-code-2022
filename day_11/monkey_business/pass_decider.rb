module MonkeyBusiness
  class PassDecider
    attr_reader :division_check_number, :monkey_id_when_true, :monkey_id_when_false
    
    def initialize(division_check_number:, monkey_id_when_true:, monkey_id_when_false:)
      @division_check_number = division_check_number
      @monkey_id_when_true = monkey_id_when_true
      @monkey_id_when_false = monkey_id_when_false
    end

    def call(variable)
      variable % division_check_number == 0 ? monkey_id_when_true : monkey_id_when_false
    end
  end
end
