require 'spec_helper'

describe PagesController do
  let(:page) { FactoryBot.create(:page) }


  describe "#show" do
    it "succeeds" do
      get :show, id: page.friendly_id
      expect(response).to be_success
    end
  end
end
