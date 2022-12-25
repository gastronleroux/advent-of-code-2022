class InputFileHandler
  FILE_PATH = "day_02/input"

  def self.read
    File.open(FILE_PATH, "r").read
  end
end
