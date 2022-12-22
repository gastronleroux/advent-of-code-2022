module MonkeyBusiness
  class Monkey
    attr_reader :items, :id, :business_counter, :pass_decider

    # @param repository   [MonkeyBusiness::Repository] Repository of all monkeys.
    # @param id           [Integer]                    ID of the monkey.
    # @param items        [Array<Integer>]             Worry Level values of items the
    #                                                  monkey is carrying.
    # @param operation    [Symbol]                     Operation to perform on the items.
    # @param pass_decider [Symbol]                     Decider to determine which monkey
    #                                                  to pass an item to.
    def initialize(repository:, id:, items:, operation:, pass_decider:)
      @repository = repository
      @id = id
      @items = items
      @operation = operation
      @pass_decider = pass_decider
      @business_counter = 0

      add_self_to_repository
    end

    # @param deworry                    [Boolean] Whether to deworry the items before passing them on.
    # @param preserve_worry_level       [Boolean] Whether to preserve the worry level of the
    #                                       items after passing them on.
    # @param division_check_numbers_lcm [Integer] Least common multiple of all monkeys' pass_decider
    #                                        division check numbers.
    def do_the_business(deworry: false, preserve_worry_level: false, division_check_numbers_lcm: nil)
      while !items.empty?
        @business_counter += 1
        new_item_worry_level = calculate_new_item_worry_level(
          items.shift, deworry, preserve_worry_level, division_check_numbers_lcm
        )
        pass_item(new_item_worry_level)
      end
    end

    private

    attr_reader :repository, :operation

    def calculate_new_item_worry_level(item_worry_level, deworry, preserve_worry_level, division_check_numbers_lcm)
      new_item_worry_level = operation.call(item_worry_level)
      new_item_worry_level = deworry_item_worry_level(new_item_worry_level) if deworry
      new_item_worry_level = new_item_worry_level % division_check_numbers_lcm unless preserve_worry_level

      new_item_worry_level
    end

    def deworry_item_worry_level(item_worry_level)
      item_worry_level / 3
    end

    def pass_item(item_worry_level)
      monkey_id_to_pass_item_to = pass_decider.call(item_worry_level)
      monkey_to_pass_item_to = repository.find_monkey_by_id(monkey_id_to_pass_item_to)
      
      monkey_to_pass_item_to.items << item_worry_level
    end


    def add_self_to_repository
      repository.add(self)
    end
  end
end
