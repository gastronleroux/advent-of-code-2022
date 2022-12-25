module Terminal
  class Log
    attr_reader :input, :output
    
    def initialize(input:, output:)
      @input = input
      @output = output
    end

    def command
      @command ||= input.split(" ").first
    end

    def args
      @args ||= input.split(" ")[1..-1]
    end

    def command_interpeter
      @command_interpeter ||= Terminal::CommandInterpreter.const_get(command.capitalize).new(args:, output:)
    end
  end
end
