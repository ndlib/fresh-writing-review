require 'spec_helper'


describe Essay do

  subject { Essay.new }

  it "has the essay attributes" do
    ['title', 'body', 'issue', 'embed', 'template', 'alt_body', 'alt_title', 'author', 'author_biography', 'works_cited', 'discussion_questions', 'attached_files', 'essay_style', 'essay_award', 'instructor_resources'].each do | attr |
      expect(subject.respond_to?(attr)).to be_true
      expect(subject.respond_to?("#{attr}=")).to be_true
    end
  end


  it "validates the title" do
    expect(subject).to have(1).error_on(:title)
  end


  it "creates a slug from the title" do
    subject.title = "title"
    subject.save

    expect(subject.friendly_id).to eq("title")
  end

  describe '#essay_style' do
    let(:essay_style) { FactoryGirl.create(:essay_style) }

    it 'belongs to an essay style' do
      expect(subject.essay_style).to be_nil
      subject.essay_style_id = essay_style.id
      expect(subject.essay_style).to be == essay_style
    end
  end


end
