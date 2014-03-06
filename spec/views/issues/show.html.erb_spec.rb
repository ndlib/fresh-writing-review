require "spec_helper"

describe "issues/show.html.erb" do
  let(:issue) { FactoryGirl.create(:issue) }
  let(:double_controller) { double(ApplicationController, params: ActionController::Parameters.new(id: issue.year)) }
  let(:issue_detail) { IssueDetail.build(double_controller) }

  it "succeeds" do
    @issue_detail = issue_detail
    render
  end
end
