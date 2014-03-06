require 'spec_helper'

describe EssayStylesController do
  let(:issue) { FactoryGirl.create(:issue) }
  let(:essay_style) { FactoryGirl.create(:essay_style) }
  describe "#show" do
    it "succeeds" do
      get :show, issue_id: issue.year, id: essay_style.slug
      expect(response).to be_success
    end
  end
end
