module Terminal
  module CommandInterpreter
    class Ls
      def initialize(args:, output:)
        @args = args
        @output = output
      end

      def command_name
        :ls
      end

      def files_byte_sizes_by_name
        @files_byte_sizes_by_name ||= output_by_type[:file].map do |args|
          arg_1, arg_2 = args.split(" ")

          [arg_2, arg_1.to_i]
        end.to_h
      end

      def directory_names
        @directory_names ||= output_by_type[:directory].map do |args|
          args.split(" ").last
        end
      end

      private

      attr_reader :args, :output

      def output_by_type
        @output_by_type ||= output.group_by do |details|
          details.split(" ").first == "dir" ? :directory : :file
        end.tap do |output_by_type|
          output_by_type[:file] ||= []
          output_by_type[:directory] ||= []
        end
      end
    end
  end
end
