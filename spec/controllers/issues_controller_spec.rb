require 'spec_helper'

describe IssuesController do

  describe "#index" do
    it "succeeds" do
      get :index
      expect(response).to be_success
    end
  end
end
