require "spec_helper"

describe "issues/index.html.erb" do
  let(:issue_list) { IssueList.build(double()) }

  before do
    FactoryBot.create(:issue)
  end

  it "succeeds" do
    @issue_list = issue_list
    render
  end
end
