require 'spec_helper'


describe MarkDownConverter do

  subject { described_class }

  describe '#call' do
    it 'returns an empty string for nil' do
      expect(subject.call(nil)).to be == ""
    end

    it 'adds a p tag' do
      expect(subject.call("a\n")).to be == "<p>a</p>\n"
    end

    it 'converts single line breaks' do
      expect(subject.call("1\n2")).to match "1<br>\n2"
    end
  end


  describe 'Filter the image titles' do
    let(:html_img_title) { "<h1>HI</h1><img src=\"url\" title=\"title\"><img src=\"url\" alt=\"otherimage\"><p>hihi</p><img src=\"url\" alt=\"blaimage\">" }
    let(:html_img_no_title) { "<h1>HI</h1><img src=\"url\" alt=\"title\"><p>hihi</p>" }

    let(:title_doc) { Nokogiri::HTML(html_img_title) }
    let(:no_title_doc) { Nokogiri::HTML(html_img_no_title) }

    it "convertes img title" do
      binding.pry

      raise
    end
  end
end
