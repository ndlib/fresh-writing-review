require 'spec_helper'

describe EssaySearchRow do

  subject { described_class.new(essay)}
  let(:essay) { double(Essay, id: 1, title: 'title', author: "author", friendly_id: 'fid', issue: issue, essay_style: essay_style )}
  let(:issue) { double(Issue, title: 'issue', friendly_id: 'ifid') }
  let(:essay_style) { double(EssayStyle, title: 'title', friendly_id: 'esfid') }

  describe '#image_link_to_essay' do
    it "renders the correct text" do
      expect(subject.image_link_to_essay).to eq("<a href=\"/issues/ifid/essays/fid\"><img alt=\"Fff\" src=\"http://placehold.it/78x50/A4A774/fff\" /></a>")
    end
  end

  describe '#link_to_essay' do
    it "renders the correct text" do
      expect(subject.link_to_essay).to eq("<a href=\"/issues/ifid/essays/fid\">title</a>")
    end
  end


  describe '#author' do
    it "renders the correct text" do
      expect(subject.author).to eq("By author")
    end
  end


  describe '#link_to_issue' do
    it "renders the correct text" do
      expect(subject.link_to_issue).to eq("<a href=\"/issues/ifid\">issue</a>")
    end
  end


  describe '#link_to_style' do
    it "renders the correct text" do
      expect(subject.link_to_style).to eq("<a href=\"/issues/ifid/style/esfid\">title</a>")
    end
  end


  describe :render do
    it "renders the correct partial" do
      expect(subject).to receive(:render_to_string).with('/search/row', { object: subject })
      subject.render
    end
  end


end
