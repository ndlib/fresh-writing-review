require 'spec_helper'


describe EssayDetail do


  describe 'build' do
    before(:each) do
      @issue = double(Issue, friendly_id: 'issue_id')
      @essay = double(Essay, id: 1, friendly_id: 'id', issue: @issue)
      @controller = double(ApplicationController, params: { issue_id: @issue.friendly_id, id: @essay.friendly_id})
      EssayQuery.stub(:essay_for_issue_from_url).with(@issue.friendly_id, @essay.friendly_id).and_return(@essay)
    end

    subject { described_class }

    it "builds from the url slug" do
      expect { subject.build(@controller) }.to_not raise_error
    end

    it "passes the essay into the object" do
      expect(subject.build(@controller).essay).to eq(@essay)
    end

  end

  let(:issue) { double(Issue, year: '2014', friendly_id: 'id') }
  let(:essay_style) { double(EssayStyle, title: 'narrative', friendly_id: 'id')}
  let(:essay) { double(Essay, title: 'title', template: "text", friendly_id: 'id', body: "", alt_body: "", alt_title: "", author: "Bob Bobbers", issue: issue, essay_style: essay_style) }
  subject { described_class.new(essay)}



  describe 'render_issue_header' do
    it "calls the sub view model" do
      expect(IssueHeader).to receive(:render).with(issue, false)
      subject.render_issue_header
    end
  end



  describe 'render_header' do
    it "calls the sub view model" do
      expect(EssayDetail::Header).to receive(:render).with(essay)
      subject.render_header
    end
  end

  describe 'render_embed' do
    it "calls the sub view model" do
      expect(EssayDetail::Embed).to receive(:render).with(essay)
      subject.render_embed
    end
  end


  describe 'render_body' do
    it "calls the sub view model" do
      expect(EssayDetail::Body).to receive(:render).with(essay)
      subject.render_body
    end
  end


  describe 'render_transcript' do
    it "calls the sub view model" do
      expect(EssayDetail::Transcript).to receive(:render).with(essay)
      subject.render_transcript
    end
  end


  describe 'render_alternate_body' do
    it "calls the sub view model" do
      expect(EssayDetail::AlternateBody).to receive(:render).with(essay)
      subject.render_alternate_body
    end
  end


  describe 'render_works_cited' do
    it "calls the sub view model" do
      expect(EssayDetail::WorksCited).to receive(:render).with(essay)
      subject.render_works_cited
    end
  end


  describe 'render_discussion_questions' do
    it "calls the sub view model" do
      expect(EssayDetail::DiscussionQuestions).to receive(:render).with(essay)
      subject.render_discussion_questions
    end
  end



  describe 'render_instructor_resources' do
    it "calls the sub view model" do
      expect(EssayDetail::InstructorResources).to receive(:render).with(essay)
      subject.render_instructor_resources
    end
  end


  describe 'render_author_biography' do
    it "calls the sub view model" do
      expect(EssayDetail::AuthorBiography).to receive(:render).with(essay)
      subject.render_author_biography
    end
  end


  describe 'render_nav' do
    it "calls the sub view model" do
      expect(EssayDetail::Nav).to receive(:render).with(essay)
      subject.render_nav
    end
  end


  describe 'render_companion_material' do
    it "calls the sub view model" do
      expect(EssayDetail::CompanionMaterial).to receive(:render).with(essay)
      subject.render_companion_material
    end
  end
end
