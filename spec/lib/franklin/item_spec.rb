require "spec_helper"
require "securerandom"

module Franklin
  describe Item do
    subject { described_class.new(id, title, author, format) }
    let(:id) { SecureRandom.uuid }
    let(:title) { "Ender's Game" }
    let(:author) { "Orson Scott Card" }
    let(:format) { "eBook" }

    it "has an id" do
      expect(subject.id).to be == id
    end

    it "has a title" do
      expect(subject.title).to be == title
    end

    it "has an author" do
      expect(subject.author).to be == author
    end

    it "has a format" do
      expect(subject.format).to be == format
    end

    it "can be compared to other items by value" do
      expect(subject).to_not be == described_class.new(SecureRandom.uuid, title, author, format)
      expect(subject).to be == described_class.new(id, title, author, format)
    end
  end
end
