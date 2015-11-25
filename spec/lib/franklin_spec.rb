require "spec_helper"

describe Franklin do
  it "has a version number" do
    expect(Franklin::VERSION).not_to be nil
  end

  describe ".run", vcr: true do
    it "integrates end-to-end" do
      expect { Franklin.run("Seveneves", StringIO.new) }.to_not raise_error
    end
  end
end
