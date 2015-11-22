require "spec_helper"

module Franklin
  describe Library do
    subject { described_class.new(name, url) 	}
    let(:name) { "San Francisco Public Library" }
    let(:url) { "http://sfpl.lib.overdrive.com/" }

    it "has a name" do
      expect(subject.name).to be == name
    end

    it "has a url" do
      expect(subject.url).to be == url
    end
  end
end
