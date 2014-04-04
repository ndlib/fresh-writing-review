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
      expect(subject.essay_for_issue_from_url(essay.issue.friendly_id, essay.friendly_id)).to eq(essay)
    end

    it "raises active record not found when the issue is not found " do
      i = FactoryGirl.create(:issue)
      expect{ described_class.essay_for_issue_from_url(i.friendly_id, essay.friendly_id)}.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "raises active record not found when the id is not found" do
      expect{ described_class.essay_for_issue_from_url(essay.issue.friendly_id, 0)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end


  describe "#published_essays_for_issue_and_essay_style" do
    before do
      @issue = FactoryGirl.create(:issue)
      @essay_style = FactoryGirl.create(:essay_style)
      @essays = FactoryGirl.create_list(:essay, 2, issue: @issue, essay_style: @essay_style)
    end

    it "returns the essays for the issue and essay_style" do
      found = subject.published_essays_for_issue_and_essay_style(@issue.friendly_id, @essay_style)
      expect(found.count).to be == 2
      expect(found).to eq(@essays)
    end

    it "returns an empty array for a different issue" do
      alternate_issue = FactoryGirl.create(:issue)
      found = subject.published_essays_for_issue_and_essay_style(alternate_issue.friendly_id, @essay_style)
      expect(found.count).to be == 0
    end

    it "returns an empty array for a different essay_style" do
      alternate_style = FactoryGirl.create(:essay_style)
      found = subject.published_essays_for_issue_and_essay_style(@issue.friendly_id, alternate_style)
      expect(found.count).to be == 0
    end
  end


  describe "#published_essays_for_issue_and_essay_award" do
    before do
      @issue = FactoryGirl.create(:issue)
      @essay_award = FactoryGirl.create(:essay_award)
      @essays = FactoryGirl.create_list(:essay, 2, issue: @issue, essay_award: @essay_award, placement: [ 1, 2 ])
    end


    it "returns the essays for the issue and the award" do
      found = subject.published_essays_for_issue_and_essay_award(@issue.friendly_id, @essay_award)
      expect(found.count).to be == 2
      expect(found).to eq(@essays)
    end


    it "orders by the placement" do
      @essays[1].placement = 1
      @essays[1].save!

      @essays[0].placement = 2
      @essays[0].save!

      found = subject.published_essays_for_issue_and_essay_award(@issue.friendly_id, @essay_award)
      expect(found.first).to eq(@essays[1])
      expect(found.last).to eq(@essays[0])
    end


    it "returns an empty array for a different award" do
      alternate_award = FactoryGirl.create(:issue)
      found = subject.published_essays_for_issue_and_essay_award(alternate_award.friendly_id, @essay_award)
      expect(found.count).to be == 0
    end

    it "returns an empty array for a different essay_award" do
      alternate_award = FactoryGirl.create(:essay_award)
      found = subject.published_essays_for_issue_and_essay_award(@issue.friendly_id, alternate_award)
      expect(found.count).to be == 0
    end




  end
end
