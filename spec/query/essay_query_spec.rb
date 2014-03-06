require 'spec_helper'


describe EssayQuery do


  describe :find do
    before(:each) do
      @essay = FactoryGirl.create(:essay)
    end

    it "returns the essay found " do
      expect(EssayQuery.find(@essay.id)).to eq(@essay)
    end


    it "raises active record not found when it is not found" do
      expect{ EssayQuery.find(0)}.to raise_error(ActiveRecord::RecordNotFound)
    end

  end


  describe :essay_for_issue_from_url do
    before(:each) do
      @essay = FactoryGirl.create(:essay)
    end


    it "returns the essay for a specific issue" do
      expect(EssayQuery.essay_for_issue_from_url(@essay.issue, @essay.friendly_id)).to eq(@essay)
    end

    it "raises active record not found when the issue is not found " do
      i = FactoryGirl.create(:issue)
      expect{ EssayQuery.essay_for_issue_from_url(i, @essay.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "raises active record not found when the id is not found" do
      expect{ EssayQuery.essay_for_issue_from_url(@essay.issue, 0)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
