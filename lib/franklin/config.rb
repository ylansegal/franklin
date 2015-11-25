require_relative "library"
require "yaml"

module Franklin
  class Config
    DEFAULT_CONFIG_FILE = File.join(Dir.home, ".franklin").freeze
    attr_reader :libraries

    def initialize(data)
      @libraries = data.fetch(:libraries).map { |library|
        Library.new(library.fetch(:name), library.fetch(:url))
      }
    end

    class << self
      def from_yaml(yaml)
        new(YAML.load(yaml))
      end

      def load_from_file(file_path = DEFAULT_CONFIG_FILE)
        from_yaml(File.read(file_path))
      end
    end
  end
end
