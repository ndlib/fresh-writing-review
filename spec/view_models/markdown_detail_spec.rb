require 'spec_helper'

describe MarkdownDetail do

  describe 'no content' do
    subject { described_class.new(nil) }

    describe '#markdown' do
      it 'returns an empty string' do
        expect(subject.markdown).to eq('')
      end
    end

    describe '#present?' do
      it 'is false' do
        expect(subject.present?).to be_falsey
      end
    end

    describe '#blank?' do
      it 'is true' do
        expect(subject.blank?).to be_truthy
      end
    end
  end

  describe 'markdown' do

    subject { described_class.new(MarkdownContent.new(content: "markdown text"))}

    it "calls the markdown converter" do
      expect(MarkDownConverter).to receive(:call).with("markdown text")
      subject.markdown
    end

  end


  describe 'present?' do
    subject { described_class }

    it "returns true when markdown is present" do
      expect(described_class.new(double(MarkdownContent, content: "markdown"))).to be_present
    end

    it "returns false when the markdown is nil" do
      expect(described_class.new(double(MarkdownContent, content: nil))).to_not be_present
    end

    it "returns false when the markdown is empty" do
      expect(described_class.new(double(MarkdownContent, content: ""))).to_not be_present
    end
  end


  describe 'blank?' do
    subject { described_class }

    it "returns true when markdown is present" do
      expect(described_class.new(double(MarkdownContent, content: "markdown"))).to_not be_blank
    end

    it "returns false when the markdown is nil" do
      expect(described_class.new(double(MarkdownContent, content: nil))).to be_blank
    end

    it "returns false when the markdown is empty" do
      expect(described_class.new(double(MarkdownContent, content: ""))).to be_blank
    end
  end
end
