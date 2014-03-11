require 'spec_helper'


describe EssayQuery do
  subject { described_class }
  let(:essay) { FactoryGirl.create(:essay) }

  describe :find do
    it "returns the essay found " do
      expect(subject.find(essay.id)).to eq(essay)
    end


    it "raises active record not found when it is not found" do
      expect{ subject.find(0)}.to raise_error(ActiveRecord::RecordNotFound)
    end

  end


  describe :essay_for_issue_from_url do

    it "returns the essay for a specific issue" do
      expect(subject.essay_for_issue_from_url(essay.issue, essay.friendly_id)).to eq(essay)
    end

    it "raises active record not found when the issue is not found " do
      i = FactoryGirl.create(:issue)
      expect{ described_class.essay_for_issue_from_url(i, essay.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "raises active record not found when the id is not found" do
      expect{ described_class.essay_for_issue_from_url(essay.issue, 0)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "#essays_for_issue_and_essay_style" do
    before do
      @issue = FactoryGirl.create(:issue)
      @essay_style = FactoryGirl.create(:essay_style)
      @essays = FactoryGirl.create_list(:essay, 2, issue: @issue, essay_style: @essay_style)
    end

    it "returns the essays for the issue and essay_style" do
      found = subject.essays_for_issue_and_essay_style(@issue, @essay_style)
      expect(found.count).to be == 2
      expect(found).to eq(@essays)
    end

    it "returns an empty array for a different issue" do
      alternate_issue = FactoryGirl.create(:issue)
      found = subject.essays_for_issue_and_essay_style(alternate_issue, @essay_style)
      expect(found.count).to be == 0
    end

    it "returns an empty array for a different essay_style" do
      alternate_style = FactoryGirl.create(:essay_style)
      found = subject.essays_for_issue_and_essay_style(@issue, alternate_style)
      expect(found.count).to be == 0
    end
  end
end
