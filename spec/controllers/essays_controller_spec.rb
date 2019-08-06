require 'spec_helper'

describe EssaysController do

  let(:issue) {double(Issue, friendly_id: 'issue_id')}
  let(:essay) {double(Essay, friendly_id: 'id', issue: issue)}

  before(:each) do
    controller.stub(:authorize_read_issue!).and_return(true)
    controller.stub(:authorize_read_essay!).and_return(true)
    EssayQuery.stub(:essay_for_issue_from_url).with(issue.friendly_id, essay.friendly_id).and_return(essay)
  end


  describe 'show' do
    it "does not fail" do
      get :show, issue_id: issue.friendly_id, id: essay.friendly_id
      expect(response).to be_success
    end

    it "assigns the view model" do
      get :show, issue_id: issue.friendly_id, id: essay.friendly_id
      expect(assigns(:essay_detail)).to be_a(EssayDetail)
    end
  end


  describe 'transcript' do
    it "does not fail" do
      get :transcript, issue_id: issue.friendly_id, id: essay.friendly_id
      expect(response).to be_success
    end

    it "assigns the view model" do
      get :transcript, issue_id: issue.friendly_id, id: essay.friendly_id
      expect(assigns(:essay_detail)).to be_a(EssayDetail)
    end
  end


  describe 'instructor_resources' do

    it "does not fail" do
      get :instructor_resources, issue_id: issue.friendly_id, id: essay.friendly_id
      expect(response).to be_success
    end


    it "assigns the view model" do
      get :instructor_resources, issue_id: issue.friendly_id, id: essay.friendly_id
      expect(assigns(:essay_detail)).to be_a(EssayDetail)
    end
  end

end

