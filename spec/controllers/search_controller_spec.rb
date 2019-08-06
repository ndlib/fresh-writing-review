require 'spec_helper'

describe SearchController do


  describe 'index' do
    it "does not fail" do
      get :index
      expect(response).to be_success
    end

    it "assigns the view model" do
      get :index
      expect(assigns(:essay_search)).to be_a(EssaySearch)
    end
  end
end
