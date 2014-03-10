require 'spec_helper'

describe MarkdownDetail do


  describe :markdown do

    subject { described_class.new("markdown text")}

    it "calls the markdown converter" do
      expect(MarkDownConverter).to receive(:call).with("markdown text")
      subject.markdown
    end

  end


  describe :present? do
    subject { described_class }

    it "returns true when markdown is present" do
      expect(described_class.new("markdown")).to be_present
    end

    it "returns false when the markdown is nil" do
      expect(described_class.new(nil)).to_not be_present
    end

    it "returns false when the markdown is empty" do
      expect(described_class.new("")).to_not be_present
    end
  end


  describe :blank? do
    subject { described_class }

    it "returns true when markdown is present" do
      expect(described_class.new("markdown")).to_not be_blank
    end

    it "returns false when the markdown is nil" do
      expect(described_class.new(nil)).to be_blank
    end

    it "returns false when the markdown is empty" do
      expect(described_class.new("")).to be_blank
    end
  end
end
