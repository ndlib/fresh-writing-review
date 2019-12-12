require 'spec_helper'

describe EssayAwardQuery do
  subject { described_class }
  let(:essay_award) { FactoryBot.create(:essay_award) }

  describe 'find' do
    it "returns the essay award found " do
      expect(subject.find(essay_award.id)).to eq(essay_award)
    end


    it "raises active record not found when it is not found" do
      expect{ subject.find(0)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "#published_essay_awards_for_issue_and_award" do
    before do
      @issue = FactoryBot.create(:issue)
      @award = FactoryBot.create(:award)
      @essays = FactoryBot.create_list(:essay, 2, issue: @issue, award: @award)
    end


    it "returns the essay awards for the issue and the award" do
      found = subject.published_essay_awards_for_issue_and_award(@issue.friendly_id, @award)
      expect(found.count).to be == 2
    end


    it "orders by the placement" do
      @essays[1].essay_award.update_attribute(:placement, 1)

      @essays[0].essay_award.update_attribute(:placement, 2)

      found = subject.published_essay_awards_for_issue_and_award(@issue.friendly_id, @award)
      expect(found.first).to eq(@essays[1].essay_award)
      expect(found.last).to eq(@essays[0].essay_award)
    end


    it "returns an empty array for a different award" do
      alternate_award = FactoryBot.create(:issue)
      found = subject.published_essay_awards_for_issue_and_award(alternate_award.friendly_id, @award)
      expect(found.count).to be == 0
    end

    it "returns an empty array for a different award" do
      alternate_award = FactoryBot.create(:award)
      found = subject.published_essay_awards_for_issue_and_award(@issue.friendly_id, alternate_award)
      expect(found.count).to be == 0
    end

  end
end
