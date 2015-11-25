$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "franklin"
require "pry"
require "vcr"
require "securerandom"

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_doubled_constant_names = true
  end
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
  config.configure_rspec_metadata!
end

module Franklin
  class Library
    class << self
      def fixture
        new("San Francisco Public Library", "http://sfpl.lib.overdrive.com")
      end

      def random_fixture
        new(SecureRandom.hex, "http://#{SecureRandom.hex}.com")
      end
    end
  end

  class Availability
    class << self
      def random_fixture
        new(Library.random_fixture, rand(20), rand(15), 0)
      end
    end
  end

  class Item
    class << self
      def random_fixture
        new(SecureRandom.uuid, SecureRandom.hex, SecureRandom.hex, "eBook")
      end
    end
  end
end
