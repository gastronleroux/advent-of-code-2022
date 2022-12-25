module Terminal
  module CommandInterpreter
    class Cd
      def initialize(args:, output:)
        @args = args
        @output = output
      end

      def command_name
        :cd
      end

      def directory_name
        args.first
      end
      
      private

      attr_reader :args, :output
    end
  end
end
