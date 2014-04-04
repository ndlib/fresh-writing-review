require 'spec_helper'


describe EssayAwardDetail do
  let(:issue) { double(Issue, title: 'title', id: 1, friendly_id: 'fid') }
  let(:essay_award) { double(EssayAward, title: 'title', id: 1, friendly_id: 'eafid', body: double(MarkdownContent, content: "Body")) }
  let(:essay) { double(Essay, id: 1, title: 'essay')}

  subject { described_class.new(issue, essay_award)}



  describe :build do
    before(:each) do
      @controller = double(ApplicationController, params: ActionController::Parameters.new(issue_id: issue.friendly_id, id: essay_award.friendly_id ))
      EssayAwardQuery.stub(:find).with(essay_award.friendly_id).and_return(essay_award)
      IssueQuery.stub(:find).with(issue.friendly_id)
    end

    subject { described_class }

    it "builds from the url slug" do
      expect { subject.build(@controller) }.to_not raise_error
    end

    it "passes the essay into the object" do
      expect(subject.build(@controller).essay_award).to eq(essay_award)
    end

  end



  describe '#link_to_detail' do
    it 'links to the style show page' do
      expect(subject.link_to_detail).to eq("<a href=\"/volumes/fid/award/eafid\"><img alt=\"Fff\" src=\"http://placehold.it/211x135/A4A774/fff\" /></a> <a class=\"title\" href=\"/volumes/fid/award/eafid\">title</a>")
    end
  end


  describe "#link_to_essay" do
    it "calls the essay link render" do
      expect(EssayLink).to receive(:render).with(essay)
      subject.link_to_essay(essay)
    end
  end


  describe "#has_essays?" do
    it "is true when the award has essays" do
      subject.stub(:essays).and_return([essay])
      expect(subject.has_essays?).to be_true
    end

    it "returns false when the award does not have essays" do
      subject.stub(:essays).and_return([])
      expect(subject.has_essays?).to be_false
    end
  end


  describe "#essays" do
    it "calls essays the correct essay query" do
      expect(EssayQuery).to receive(:published_essays_for_issue_and_essay_award).with(issue.friendly_id, essay_award)
      subject.essays
    end
  end


  describe "#body" do
    it "references the markdown object" do
      expect(essay_award.body).to respond_to(:content)
    end
  end


  describe "#render_issue_header" do
    it "calls the issue header " do
      expect(IssueHeader).to receive(:render).with(issue, false)
      subject.render_issue_header
    end
  end
end
