require 'spec_helper'


describe Essay do
  before do
    subject.stub(:perform_index_tasks)
  end

  subject { Essay.new }

  it "has the essay attributes" do
    ['title', 'body', 'issue', 'embed', 'alt_body', 'alt_title', 'author', 'author_biography', 'works_cited', 'discussion_questions', 'attached_files', 'essay_style', 'award', 'instructor_resources'].each do | attr |
      expect(subject.respond_to?(attr)).to be_truthy
      expect(subject.respond_to?("#{attr}=")).to be_truthy
    end
  end


  it "validates the title" do
    subject.valid?
    expect(subject.errors.count).to eq(1)
  end


  it "creates a slug from the title" do
    subject.title = "title"
    subject.save

    expect(subject.friendly_id).to eq("title")
  end

  describe '#essay_style' do
    let(:essay_style) { FactoryBot.create(:essay_style) }

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

  describe '#issue_published?' do
    it "is false without an issue" do
      subject.issue = nil
      expect(subject.issue_published?).to be_falsey
    end

    it "is false with an unpublished issue" do
      subject.issue = Issue.new(published: false)
      expect(subject.issue_published?).to be_falsey
    end

    it "is true with a published issue" do
      subject.issue = Issue.new(published: true)
      expect(subject.issue_published?).to be_truthy
    end
  end

  describe '#issue_and_essay_published?' do
    describe 'when #issue_published is true' do
      before do
        subject.stub(:issue_published?).and_return(true)
      end

      it "is false when published is false" do
        subject.published = false
        expect(subject.issue_and_essay_published?).to be_falsey
      end

      it "is true when published is true" do
        subject.published = true
        expect(subject.issue_and_essay_published?).to be_truthy
      end
    end

    describe 'when #issue_published is false' do
      before do
        subject.stub(:issue_published?).and_return(false)
      end

      it "is false when published is false" do
        subject.published = false
        expect(subject.issue_and_essay_published?).to be_falsey
      end

      it "is false when published is true" do
        subject.published = true
        expect(subject.issue_and_essay_published?).to be_falsey
      end
    end
  end

  describe '#attached_files_sorted' do
    it 'sorts attached_files by title' do
      attached_files = double()
      expect(subject).to receive(:attached_files).and_return(attached_files)
      expect(attached_files).to receive(:order).with(:title).and_return([])
      expect(subject.attached_files_sorted).to eq([])
    end
  end

  describe '#attached_files_for' do
    it 'filters attached files by file_relationship' do
      attached_files = double()
      expect(subject).to receive(:attached_files_sorted).and_return(attached_files)
      expect(attached_files).to receive(:where).with(file_relationship: 'companion_material').and_return([])
      expect(subject.attached_files_for('companion_material')).to eq([])
    end
  end

  describe '#companion_material_files' do
    it 'returns companion material files' do
      expect(subject).to receive(:attached_files_for).with('companion_material').and_return([])
      expect(subject.companion_material_files).to eq([])
    end
  end

  describe '#instructor_resources_files' do
    it 'returns instructor resources files' do
      expect(subject).to receive(:attached_files_for).with('instructor_resource').and_return([])
      expect(subject.instructor_resources_files).to eq([])
    end
  end

  describe '#highlighted_essay' do
    let(:highlighted_essay) { FactoryBot.create(:highlighted_essay) }
    subject { highlighted_essay.essay }

    it "destroys the highlighted_essay on destroy" do
      expect { subject.destroy }.to change{ HighlightedEssay.count}.by(-1)
    end
  end

  describe '#essay_award' do
    let(:essay_award) { FactoryBot.create(:essay_award) }
    subject { essay_award.essay }

    it "destroys the essay_award on destroy" do
      expect { subject.destroy }.to change{ EssayAward.count}.by(-1)
    end
  end
end
