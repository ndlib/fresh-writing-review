require 'spec_helper'


describe Essay do
  before do
    subject.stub(:perform_index_tasks)
  end

  subject { Essay.new }

  it "has the essay attributes" do
    ['title', 'body', 'issue', 'embed', 'alt_body', 'alt_title', 'author', 'author_biography', 'works_cited', 'discussion_questions', 'attached_file', 'essay_style', 'essay_award', 'instructor_resources'].each do | attr |
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

  describe 'plaintext methods' do
    %w(body alt_body discussion_questions instructor_resources).each do |method|
      it "#{method} calls #stripdown" do
        expect(subject).to receive(:stripdown)
        subject.send("#{method}_plain")
      end
    end
  end

  describe '#stripdown' do
    it 'calls StripDownConverter' do
      text = '# test'
      expect(StripDownConverter).to receive(:call).with(text)
      subject.send(:stripdown, text)
    end
  end

  describe '#sort_title' do
    it 'makes the title lowercase' do
      subject.title = 'Test'
      expect(subject.sort_title).to be == 'test'
    end

    %w(a an the).each do |article|
      it "removes preceding #{article}" do
        subject.title = "#{article} title"
        expect(subject.sort_title).to be == "title"
      end
    end
  end

end
