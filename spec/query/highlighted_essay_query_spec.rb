require 'spec_helper'

describe HighlightedEssayQuery do
  subject { described_class }

  describe "#for_issue_and_essay_style" do
    before do
      @highlighted_essay = FactoryBot.create(:highlighted_essay)
      @issue = @highlighted_essay.issue
      @essay_style = @highlighted_essay.essay_style
    end

    it "returns the highlighted essay for the issue and essay_style" do
      expect(subject.for_issue_and_essay_style(@issue, @essay_style)).to eq(@highlighted_essay)
    end

    it "returns nil for a different issue" do
      alternate_issue = FactoryBot.create(:issue)
      expect(subject.for_issue_and_essay_style(alternate_issue, @essay_style)).to be_nil
    end

    it "returns nil for a different essay_style" do
      alternate_style = FactoryBot.create(:essay_style)
      expect(subject.for_issue_and_essay_style(@issue, alternate_style)).to be_nil
    end
  end

  describe "#for_issue" do
    before do
      @issue = FactoryBot.create(:issue)
      @highlighted_essays = FactoryBot.create_list(:highlighted_essay, 2, issue: @issue)
    end

    it "returns the highlighted essays for the issue" do
      expect(subject.for_issue(@issue)).to eq(@highlighted_essays)
    end

    it "returns an empty set for a different issue" do
      alternate_issue = FactoryBot.create(:issue)
      expect(subject.for_issue(alternate_issue).count).to be == 0
    end
  end
end
