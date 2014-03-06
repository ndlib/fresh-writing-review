require 'spec_helper'

describe IssuesController do
  let(:issue) { FactoryGirl.create(:issue) }
  describe "#index" do
    it "succeeds" do
      get :index
      expect(response).to be_success
    end
  end

  describe "#show" do
    it "succeeds" do
      get :show, id: issue.year
      expect(response).to be_success
    end
  end

  describe "#editorial_notes" do
    it "succeeds" do
      get :editorial_notes, id: issue.year
      expect(response).to be_success
    end
  end

  describe "#editorial_board" do
    it "succeeds" do
      get :editorial_board, id: issue.year
      expect(response).to be_success
    end
  end

  describe "#acknowledgments" do
    it "succeeds" do
      get :acknowledgments, id: issue.year
      expect(response).to be_success
    end
  end
end
