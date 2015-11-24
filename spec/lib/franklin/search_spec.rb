require "spec_helper"

module Franklin
  describe Search do
    describe "#perform", vcr: true do
      subject { described_class.new(library) }
      let(:library) { Library.fixture }
      let(:results) { subject.perform(search_term) }
      let(:items) { results.keys }
      let(:search_term) { "Prelude to Foundation" }

      it "returns a hash with items as keys and availability as values" do
        expect(results.size).to be > 0
        results.each do |key, value|
          expect(key).to be_an(Item)
          expect(value).to be_an(Availability)
        end
      end

      it "returns expected results" do
        # These results where recorded by VCR at the time of writting this spec. They may change in the future
        expect(items.map(&:format)).to include("eBook", "Audiobook")
        expect(items.map(&:title)).to include(search_term)
        expect(items.map(&:author)).to include("Isaac Asimov")
      end
    end
  end
end
