require 'spec_helper'

describe Admin::EssayDetail do

  let(:markdown_editor_functions) { double(Admin::MarkdownEditorFunctions, essay_content_status: 'Not Visited', essay_content_link: '/admin/volumes/1/essays/test/edit') }
  let(:essay) { double(Essay, id: 1, essay_style: double(EssayStyle, title: 'test style'), title: 'title', author: 'author', volume_title: 'volume_title', issue: double(Issue, title: 'volume title'))}
  subject { Admin::EssayDetail.new(essay, markdown_editor_functions)}

  context "Essay Detail Attributes" do
    it "has an attached essay" do
      expect(subject.essay).to eq(essay)
    end

    it "has an essay_title" do
      expect(subject.essay_title).to eq('title')
    end

    it "#volume_title" do
      expect(subject.volume_title).to eq("volume title")
    end

    it "#author" do
      expect(subject.essay_author).to eq("author")
    end

    it "#essay_style" do
      expect(subject.essay_style).to eq("test style")
    end

    it "#files" do
      expect(essay).to receive(:attached_files).and_return(['file'])
      expect(subject.files).to eq(['file'])
    end

  end

  describe '#highlighted?' do
    it 'is true when a highlighted_essay is present' do
      highlighted = FactoryBot.create(:highlighted_essay)
      expect(essay).to receive(:highlighted_essay).and_return(highlighted)
      expect(subject.highlighted?).to be_truthy
    end

    it 'is false when a highlighted_essay is not present' do
      expect(essay).to receive(:highlighted_essay).and_return(nil)
      expect(subject.highlighted?).to be_falsey
    end
  end

  context "Content Edit Routing" do

    describe "#edit_content_status" do
      it "returns the status for content" do
        expect(subject.edit_content_status('test')).to eq("Not Visited")
      end
    end

    describe "#edit_content_link" do
      it "returns the essay content link" do
        expect(subject.edit_content_link('test')).to eq("/admin/volumes/1/essays/test/edit")
      end
    end

  end

end
