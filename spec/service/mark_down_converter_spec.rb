require 'spec_helper'


describe MarkDownConverter do

  subject { described_class }

  describe '#call' do
    it 'returns an empty string for nil' do
      expect(subject.call(nil)).to be == ""
    end

    it 'adds a p tag' do
      expect(subject.call("a\n")).to be == "<p>a</p>"
    end

    it 'converts single line breaks' do
      expect(subject.call("1\n2")).to match "1<br>\n2"
    end
  end


  describe 'Filter the image titles' do
    let(:html_img_title) { "<h1>HI</h1><img src=\"url\" title=\"title\"><img src=\"url\" alt=\"otherimage\"><p>hihi</p><img src=\"url\" alt=\"blaimage\">" }
    let(:html_img_no_title) { "<h1>HI</h1><img src=\"url\" alt=\"title\"><p>hihi</p>" }

    let(:title_doc) { Nokogiri::HTML.fragment(html_img_title) }
    let(:no_title_doc) { Nokogiri::HTML.fragment(html_img_no_title) }


    let(:fragment) { 'citizens who all admired Banksy\'s artwork, banded together and connected in search of his latest piece.  An NPR interview with a Banksy fanatic expressed this exact sentiment by joining in on the hunt with a citizen and documenting his interaction with the other residents of NYC as they all worked toward the common goal of finding the artwork (Nessen).


![zavarkos 1](/system/test/zavakos/figure_1_orig.png "Figure 1")
![zavarkos 1](/system/test/zavakos/figure_2_orig.png "Figure 2")

In addition to building community, street art connects nature to the city. Artists often create their art out of natural materials or with nature as their subjects.  In both cases, nature is brought to the city through street art.  Banksy has produced art all over the world. In addition to his stint in New York where he created many of his pieces out of natural '}

    it "convertes img title" do
      # binding.pry

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
    end
  end
end
