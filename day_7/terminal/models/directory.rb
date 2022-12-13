module Terminal
  class Directory
    attr_reader :name, :parent

    def initialize(name:, parent: nil)
      @name = name
      @parent = parent

      add_to_parent
    end

    def directory?
      true
    end

    def children
      @children ||= []
    end

    def directories
      children.select(&:directory?)
    end

    def all_directories
      directories.flat_map(&:all_directories).unshift(self)
    end

    def files
      children.reject(&:directory?)
    end

    def all_files
      files + directories.flat_map(&:all_files)
    end

    def total_byte_size
      children.sum(&:total_byte_size)
    end

    def find_file_by_name(name)
      children.find { |child| child.name == name }
    end

    def path
      return "/" if parent.nil?

      "#{parent.path}/#{name}"
    end

    def cd(target_path)
      return self if target_path == "." || target_path == path
      return parent if target_path == ".."
      return parent.cd(target_path) if path.start_with?(target_path)

      find_file_by_name(target_path)
    end

    def add_file(file)
      children << file
    end

    private

    def add_to_parent
      parent.add_file(self) unless parent.nil?
    end
  end
end
