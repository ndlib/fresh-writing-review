require 'spec_helper'

describe EssayFormat do

  let(:media_essay) { double(Essay, embed: double(MarkdownContent, content: 'embed')) }
  let(:text_essay) { double(Essay, embed: nil )}
  let(:alternate_text_essay) { double(Essay, embed: nil )}


  describe 'media?' do

    it "returns true for a media essay" do
      expect(described_class.new(media_essay)).to be_media
    end

    it "returns false for a text essay" do
      expect(described_class.new(text_essay)).to_not be_media
    end

    it "returns false for the alternate text essay" do
      expect(described_class.new(alternate_text_essay)).to_not be_media
    end
  end


  describe 'text?' do

    it "returns true for a media essay" do
      expect(described_class.new(media_essay)).to_not be_text
    end

    it "returns false for a text essay" do
      expect(described_class.new(text_essay)).to be_text
    end

    it "returns false for the alternate text essay" do
      expect(described_class.new(alternate_text_essay)).to be_text
    end
  end
end
