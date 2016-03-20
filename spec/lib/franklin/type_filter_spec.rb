require "spec_helper"

module Franklin
  describe TypeFilter do
    subject { described_class.new(type) }
    let(:results) {
      {
        item_1 => [availability_1],
        item_2 => [availability_2]
      }
    }
    let(:item_1) { Item.random_fixture(type) }
    let(:item_2) { Item.random_fixture }
    let(:availability_1) { Availability.random_fixture }
    let(:availability_2) { Availability.random_fixture }
    let(:type) { "holobook" }
    let(:filtered_results) { subject.perform(results) }

    it "filters results for a given type" do
      expect(filtered_results).to be == { item_1 => [availability_1] }
    end

    context "when type is in different case" do
      let(:type) { "HoLoBOOK" }

      it "filters results" do
        expect(filtered_results).to be == { item_1 => [availability_1] }
      end
    end

    context "when the type is nil" do
      let(:type) { nil }

      it "returns unmodified results" do
        expect(filtered_results).to be == results
      end
    end
  end
end
