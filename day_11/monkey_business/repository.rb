module MonkeyBusiness
  class Repository
    attr_reader :monkeys

    def initialize
      @monkeys = []
    end

    def do_the_business(**kwargs)
      monkeys.each { |monkey| monkey.do_the_business(**kwargs, division_check_numbers_lcm:) }
    end

    def add(monkey)
      monkeys << monkey
    end

    def find_monkey_by_id(id)
      monkeys.find { |monkey| monkey.id == id }
    end

    def division_check_numbers_lcm
      monkeys.map { |monkey| monkey.pass_decider.division_check_number }.reduce(:lcm)
    end
  end
end
