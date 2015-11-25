require "spec_helper"

module Franklin
  describe ConsoleReport do
    subject { described_class.new(search_terms, collated_resuts) }
    let(:search_terms) { "crime and punishment" }
    let(:collated_resuts) { { item => [availability] } }
    let(:result) { subject.print_to_out(io).string }
    let(:io) { StringIO.new }
    let(:item) { Item.random_fixture }
    let(:availability) { Availability.random_fixture }
    let(:availability_description) { AvailabilityDescription.new(availability) }

    describe ".print_to_out" do
      it "includes search_term" do
        expect(result).to match(/#{search_terms}/)
      end

      it "includes item information" do
        expect(result).to match(/^#{item.title}/)
        expect(result).to match(/^By #{item.author}/)
        expect(result).to match(/^Format: #{item.format}/)
      end

      it "includes availability information" do
        expect(result).to match(/^Availability:/)
        expect(result).to match(/^  #{availability_description}/)
      end
    end
  end
end
