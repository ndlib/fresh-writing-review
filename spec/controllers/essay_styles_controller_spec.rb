require 'spec_helper'

describe EssayStylesController do
  let(:issue) { FactoryBot.create(:issue) }
  let(:essay_style) { FactoryBot.create(:essay_style) }
  describe "#show" do
    it "succeeds" do
      get :show, issue_id: issue.friendly_id, id: essay_style.friendly_id
      expect(response).to be_success
    end
  end
end
