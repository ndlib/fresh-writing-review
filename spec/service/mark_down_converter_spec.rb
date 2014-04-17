require 'spec_helper'


describe MarkDownConverter do

  subject { described_class }

  describe '#call' do
    it 'returns an empty string for nil' do
      expect(subject.call(nil)).to be == ""
    end

    it 'adds a p tag' do
      expect(subject.call("a\n")).to match "<p>a</p>"
    end

    it 'converts single line breaks' do
      expect(subject.call("1\n2")).to match "1<br>\n2"
    end
  end

  shared_examples_for "preprocessed_images" do
    it "processes images" do
      expect(subject.preprocess_images(input)).to be == output
    end
  end

  describe 'instance' do
    subject { described_class.new('') }

    describe '#preprocess_images' do
      describe "two images" do
        let(:input) {"Example text\n\n![image alt][1]\n![image alt2][2]\n\nMore example text"}
        let(:output) {"Example text\n\n![image alt][1] ![image alt2][2]\n\nMore example text"}

        it_behaves_like "preprocessed_images"
      end

      describe "three images" do
        let(:input) {"Example text\n\n![image alt][1]\n![image alt2][2]\n![image alt3][3]\n\nMore example text"}
        let(:output) {"Example text\n\n![image alt][1] ![image alt2][2] ![image alt3][3]\n\nMore example text"}

        it_behaves_like "preprocessed_images"
      end

      describe "three images carriage returns" do
        let(:input) {"They should therefore be allowed to create their art and have their work protected.\r\n\r\n![zavarkos 8][8]\r\n![zavarkos 9][9]\r\n![zavarkos 10][10]\r\n\r\n\r\nIn all"}
        let(:output) {"They should therefore be allowed to create their art and have their work protected.\n\n![zavarkos 8][8] ![zavarkos 9][9] ![zavarkos 10][10]\n\nIn all"}

        it_behaves_like "preprocessed_images"
      end

      describe "three images one line" do
        let(:input) {"Paragraph 1\n\nExample text ![image alt][1]\n![image alt2][2]\n![image alt3][3] More example text"}
        let(:output) {"Paragraph 1\n\nExample text\n\n![image alt][1] ![image alt2][2] ![image alt3][3]\n\nMore example text"}

        it_behaves_like "preprocessed_images"
      end

      describe "three images single line breaks" do
        let(:input) {"Example text\n![image alt][1]\n![image alt2][2]\n![image alt3][3]\nMore example text"}
        let(:output) {"Example text\n\n![image alt][1] ![image alt2][2] ![image alt3][3]\n\nMore example text"}

        it_behaves_like "preprocessed_images"
      end

      describe "three images no alt text" do
        let(:input) {"Example text\n![][1]\n![][2]\n![][3]\nMore example text"}
        let(:output) {"Example text\n\n![][1] ![][2] ![][3]\n\nMore example text"}

        it_behaves_like "preprocessed_images"
      end
    end

    describe '#parse_image_tags' do
      let(:image_path) { "/system/images/1/small/figure_1_orig.png" }
      let(:caption) { "Test Title" }
      let(:image) { "<img src=\"#{image_path}\" title=\"#{caption}\">" }
      let(:input) { image }
      let(:output) {"#{described_class::IMAGE_SPLIT_TEXT}<figure>#{image}<figcaption>#{caption}</figcaption></figure>#{described_class::IMAGE_SPLIT_TEXT}"}

      it "adds a caption" do
        expect(subject.parse_image_tags(input)).to match("<figcaption>#{caption}</figcaption>")
      end

      it "adds a figure tag around the image" do
        expect(subject.parse_image_tags(input)).to match(/<figure>.*<img.*<\/figure>/)
      end

      it "adds a link" do
        expect(subject.parse_image_tags(input)).to match(/<a.*<img.*<\/a>/)
      end

      it "adds lightbox data attributes" do
        expect(subject.parse_image_tags(input)).to match(/data-lightbox/)
        expect(subject.parse_image_tags(input)).to match(/data-title/)
      end
    end
  end
end
