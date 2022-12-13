module Terminal
  class File
    attr_reader :name, :byte_size, :parent

    def initialize(name:, byte_size:, parent:)
      @name = name
      @byte_size = byte_size
      @parent = parent

      add_to_parent
    end

    def directory?
      false
    end

    def total_byte_size
      byte_size
    end

    private

    def add_to_parent
      parent.add_file(self) unless parent.nil?
    end
  end
end
