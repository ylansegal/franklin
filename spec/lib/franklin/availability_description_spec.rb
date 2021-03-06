require "spec_helper"

module Franklin
  describe AvailabilityDescription do
    describe "#to_s" do
      let(:result) { described_class.new(availability).to_s }
      let(:library) { Library.fixture }

      context "when available_copies > 0" do
        let(:availability) { Availability.new(library, 10, 2, 0) }

        it "describes it as available" do
          expect(result).to be == "Available @ #{availability.library.name}"
        end
      end

      context "when available_copies = 0" do
        context "when wait_list_size is reported" do
          let(:availability) { Availability.new(library, 4, 0, 13) }

          it "describes the people per copy" do
            expect(result).to be == "3.3 people/copy @ #{availability.library.name}"
          end
        end

        context "when wait_list_size is not reported" do
          let(:availability) { Availability.new(library, 4, 0, 0) }

          it "describes unkown people per copy" do
            expect(result).to be == "Unknown people/copy @ #{availability.library.name}"
          end
        end
      end
    end
  end
end
