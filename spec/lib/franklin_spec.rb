require "spec_helper"

describe Franklin do
  it "has a version number" do
    expect(Franklin::VERSION).not_to be nil
  end

  describe ".run", vcr: true do
    let(:example_config_path) { File.join(__dir__, "example_franklin_config.yml") }

    it "integrates end-to-end" do
      expect { Franklin.run("Seveneves", config_path: example_config_path, out: StringIO.new) }.to_not raise_error
    end
  end
end
