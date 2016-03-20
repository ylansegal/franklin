require_relative "library"
require "yaml"

module Franklin
  class Config
    DEFAULT_CONFIG_FILE = File.join(Dir.home, ".franklin").freeze
    attr_reader :libraries, :default_type

    def initialize(data)
      @libraries = data.fetch(:libraries).map { |library|
        Library.new(library.fetch(:name), library.fetch(:url))
      }
      @default_type = data[:default_type]
    end

    class << self
      def from_yaml(yaml)
        new(YAML.load(yaml))
      end

      def load_from_file(file_path = nil)
        from_yaml(File.read(file_path || DEFAULT_CONFIG_FILE))
      end
    end
  end
end
