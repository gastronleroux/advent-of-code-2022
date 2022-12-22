require 'yaml'

module MonkeyBusiness
  class Deserializer
    def initialize(input)
      @input = input
    end

    def deserialize
      repository = MonkeyBusiness::Repository.new

      yaml_input.each do |monkey_name, monkey_data|
        MonkeyBusiness::Monkey.new(
          id: build_monkey_id(monkey_name),
          items: build_items(monkey_data),
          operation: build_operation(monkey_data),
          pass_decider: build_pass_decider(monkey_data),
          repository: repository
        )
      end

      repository
    end

    private

    attr_reader :input

    def build_monkey_id(monkey_name)
      monkey_name.split(" ")[1].to_i
    end

    def build_items(monkey_data)
      monkey_data["Starting items"].to_s.split(", ").map(&:to_i)
    end

    def build_operation(monkey_data)
      raw_value_1, raw_operator, raw_value_2 = monkey_data["Operation"][6..].split(" ")

      value_1, value_2 = [raw_value_1, raw_value_2].map do |value|
        value == "old" ? :variable : value.to_i
      end
      operator = raw_operator.to_sym

      @operation = MonkeyBusiness::Operation.new(value_1:, operator:, value_2:)
    end

    def build_pass_decider(monkey_data)
      MonkeyBusiness::PassDecider.new(
        division_check_number: monkey_data["Test"][13..].to_i,
        monkey_id_when_true: monkey_data["If true"][16..].to_i,
        monkey_id_when_false: monkey_data["If false"][16..].to_i
      )
    end

    def yaml_input
      @yaml_input ||= YAML.load(input)
    end
  end
end
