module Terminal
  class File
    attr_reader :name, :byte_size, :parent

    def initialize(byte_size:, name:, parent: nil)
      @byte_size = byte_size
      @name = name
      @parent = parent

      add_to_parent
    end

    def directory?
      false
    end

    private

    def add_to_parent
      parent.add_file(self) unless parent.nil?
    end
  end
end
