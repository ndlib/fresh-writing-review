require 'spec_helper'

describe IssuesController do
  let(:issue) { FactoryGirl.create(:issue) }
  describe "#index" do
    it "succeeds" do
      get :index
      expect(response).to be_success
    end
  end

  describe "#current" do
    it "gets the current issue" do
      current_issue = issue
      expect(IssueDetail).to receive(:current)
      get :current
      expect(response).to be_success
    end

    it 'redirects if there is no issue' do
      get :current
      expect(response).to be_redirect
    end
  end

  describe "#show" do
    it "succeeds" do
      get :show, id: issue.friendly_id
      expect(response).to be_success
    end
  end

  describe "#editorial_notes" do
    it "succeeds" do
      get :editorial_notes, id: issue.friendly_id
      expect(response).to be_success
    end
  end

  describe "#editorial_board" do
    it "succeeds" do
      get :editorial_board, id: issue.friendly_id
      expect(response).to be_success
    end
  end

  describe "#acknowledgements" do
    it "succeeds" do
      get :acknowledgements, id: issue.friendly_id
      expect(response).to be_success
    end
  end
end
