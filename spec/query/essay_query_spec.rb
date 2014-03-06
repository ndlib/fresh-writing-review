require 'spec_helper'


describe EssayQuery do


  describe :find do

    it "returns the essay found " do
      e = Essay.create(body: 'body')
      expect(EssayQuery.find(e.id)).to eq(e)
    end


    it "raises active record not found when it is not found" do
      expect{ EssayQuery.find(0)}.to raise_error(ActiveRecord::RecordNotFound)
    end

  end

end
