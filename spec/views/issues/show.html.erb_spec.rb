require "spec_helper"

describe "issues/show.html.erb" do
  let(:issue) { FactoryBot.create(:issue) }
  let(:double_controller) { double(ApplicationController, params: ActionController::Parameters.new(id: issue.friendly_id)) }
  let(:issue_detail) { IssueDetail.build(double_controller) }

  it "succeeds" do
    @issue_detail = issue_detail
    render
  end
end
