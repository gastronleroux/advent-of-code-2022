require_relative "monkey_business"

input = File.read("day_11/input.yml")
monkey_repository = MonkeyBusiness::Deserializer.new(input).deserialize
20.times { monkey_repository.do_the_business(deworry: true) }

p monkey_repository.monkeys.map(&:business_counter).max(2).reduce(:*)
