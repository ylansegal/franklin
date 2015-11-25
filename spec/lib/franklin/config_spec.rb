require "spec_helper"
require "yaml"

module Franklin
  describe Config do
    let(:config_data) { { libraries: [{ name: library.name, url: library.url }] } }
    let(:library) { Library.new("Alexnadria Library", "http://alexandria.eg") }
    let(:yaml) { YAML.dump(config_data) }

    describe "#initialize" do
      subject { described_class.new(config_data) }

      it "constructs libraries from data hash" do
        expect(subject.libraries).to be == [library]
      end
    end

    describe ".from_yaml" do
      subject { described_class.from_yaml(yaml) }

      it "constructs a config from yaml" do
        expect(subject.libraries).to be == [library]
      end
    end

    describe ".load" do
      subject { described_class.load_from_file(file_path) }
      let(:file_path) { "franklin.config" }

      before { File.write(file_path, yaml) }
      after { File.delete(file_path) }

      it "loads a config from a file" do
        expect(subject.libraries).to be == [library]
      end

      context "when no file_path is provided" do
        subject { described_class.load_from_file }
        let(:default_path) { File.join(Dir.home, ".franklin") }

        it "defaults to ~/.franklin" do
          expect(File).to receive(:read).with(default_path).and_return(yaml)
          expect(subject.libraries).to be == [library]
        end
      end

      context "when nil file_path is provided" do
        subject { described_class.load_from_file(nil) }
        let(:default_path) { File.join(Dir.home, ".franklin") }

        it "defaults to ~/.franklin" do
          expect(File).to receive(:read).with(default_path).and_return(yaml)
          expect(subject.libraries).to be == [library]
        end
      end
    end
  end
end
