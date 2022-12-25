module Terminal
  class LogsDeserializer
    def initialize(input)
      @input = input
    end

    def deserialize
      logs.each do |log|
        log_input, *log_output = log.split("\n")
        command_interpeter = Terminal::Log.new(input: log_input, output: log_output).command_interpeter
        execute_command(command_interpeter)
      end

      root_directory
    end

    private

    attr_reader :input

    def logs
      input.sub("$ ", "").split("\n$ ")
    end

    def execute_command(command_interpeter)
      case command_interpeter.command_name
      when :ls
        add_files_to_current_directory(command_interpeter)
      when :cd
        change_current_directory(command_interpeter)
      end
    end

    def add_files_to_current_directory(command_interpeter)
      command_interpeter.files_byte_sizes_by_name.each do |name, byte_size|
        Terminal::File.new(name: name, byte_size: byte_size, parent: current_directory)
      end

      command_interpeter.directory_names.each do |directory_name|
        Terminal::Directory.new(name: directory_name, parent: current_directory)
      end
    end

    def change_current_directory(command_interpeter)
      @current_directory = current_directory.cd(command_interpeter.directory_name)
    end

    def current_directory
      @current_directory ||= root_directory
    end

    def root_directory
      @root_directory ||= Terminal::Directory.new(name: "root")
    end
  end
end
