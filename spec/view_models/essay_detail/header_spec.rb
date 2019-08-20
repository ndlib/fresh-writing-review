require 'spec_helper'

describe EssayDetail::Header do

  let(:issue) { double(Issue, friendly_id: 'id', title: 'issue_title') }
  let(:essay_style) { double(EssayStyle, title: 'narrative', friendly_id: 'id')}
  let(:essay) { double(Essay, title: 'title', author: "Bob Bobbers", issue: issue, essay_style: essay_style) }
  subject { described_class.new(essay)}

  describe 'self_render' do

    it "instanciates itself and renders" do
      described_class.any_instance.should_receive(:render)

      described_class.render(essay)
    end

  end

  describe 'title' do
    let(:essay) { double(Essay, title: 'title') }

    it "delegates this to essay" do
      expect(essay).to receive(:title)

      subject.title
    end
  end


  describe 'author' do

    it "creates a named anchor link and adds the by text" do
      expect(subject.author).to eq("By <a href=\"#author_biography\">Bob Bobbers</a>")
    end
  end


  describe 'issue_link' do

    it "generates an issue link " do
      expect(subject.issue_link).to eq("<a href=\"/volumes/id\">issue_title</a>")
    end
  end


  describe 'essay_style_link' do
    it "generates a essay style link " do
      expect(subject.essay_style_link).to eq("<a href=\"/volumes/id/style/id\">narrative</a>")
    end
  end

  describe 'render' do
    it "renders the template " do
      expect(subject).to receive(:render_to_string).with('/essays/header', { object: subject })
      subject.render
    end

    it "renders with out error " do
      expect { subject.render }.to_not raise_error
    end
  end
end
