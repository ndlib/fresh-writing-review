require 'spec_helper'

describe EssayLink do

  subject { described_class.new(essay)}
  let(:essay) { double(Essay, id: 1, title: 'title', author: "author", friendly_id: 'fid', issue: issue, essay_style: essay_style, cover_image: double(Image, url: 'url') )}
  let(:issue) { double(Issue, title: 'issue', friendly_id: 'ifid') }
  let(:essay_style) { double(EssayStyle, title: 'title', friendly_id: 'esfid') }

  describe '#link_to_image' do
    it "renders the correct text" do
      expect(subject.link_to_image).to eq("<a href=\"/volumes/ifid/essays/fid\"><img alt=\"Url\" src=\"/images/url\" /></a> <a class=\"title\" href=\"/volumes/ifid/essays/fid\">title</a>")
    end
  end


  describe '#author' do
    it "renders the correct text" do
      expect(subject.author).to eq("By author")
    end
  end


  describe '#link_to_issue' do
    it "renders the correct text" do
      expect(subject.link_to_issue).to eq("<a href=\"/volumes/ifid\">issue</a>")
    end
  end


  describe '#link_to_style' do
    it "renders the correct text" do
      expect(subject.link_to_style).to eq("<a href=\"/volumes/ifid/style/esfid\">title</a>")
    end
  end


  describe :render do
    it "renders the correct partial" do
      expect(subject).to receive(:render_to_string).with('/essays/link', { object: subject, show_volume_style_links: true })
      subject.render
    end
  end


end
